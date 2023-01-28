function checkAlive(){
  node=$1
  character=$2
  workerRst=$(docker exec -t $node /bin/bash -ic 'jps')
  result=$(echo $workerRst | grep "${character}")
  if [[ "$result" == "" ]]; then
        echo "jps $node: $workerRst"
        sh failTest.sh "${node} ${character} was not started"
  fi
}

function checkAllAlive(){
  checkAlive "C1HM1" "HMaster"
  checkAlive "C1HM2" "HMaster"
  checkAlive "C1RS1" "HRegionServer"
  checkAlive "C1RS2" "HRegionServer"
#  checkAlive "C1RS3" "HRegionServer"
}

crashed="true"
restarted="true"
crashNodeIP=$3
if [[ "$1" == "0" ]]; then
        crashed="false"
fi

if [[ "$2" == "0" ]]; then
        restarted="false"
fi

if [ "$crashed" == "false" ] || [ "$restarted" == "true" ]; then
        checkAllAlive
fi
sh jpsCluster.sh

if [ "$crashed" == "true" ]; then
    case $crashNodeIP in
      172.25.0.2)
        ;;
      172.25.0.3)
        ;;
      172.25.0.4)
        hm1log=$(docker exec -t C1HM1 /bin/bash -ic "cd /home/gaoyu/evaluation/hbase-2.4.8/ && grep -r \"Processing expiration of c1rs1\" logs")
        hm2log=$(docker exec -t C1HM2 /bin/bash -ic "cd /home/gaoyu/evaluation/hbase-2.4.8/ && grep -r \"Processing expiration of c1rs1\" logs")
        echo "For the crash node $crashNodeIP, the recovery info is $hm1log and $hm2log."
        if [ "$hm1log" == "" ] && [ "$hm2log" == "" ]; then
           sh failTest.sh "The failure of node $crashNodeIP seems was not handled by HMaster!"
        fi
        ;;
     172.25.0.5)
        hm1log=$(docker exec -t C1HM1 /bin/bash -ic "cd /home/gaoyu/evaluation/hbase-2.4.8/ && grep -r \"Processing expiration of c1rs2\" logs")
        hm2log=$(docker exec -t C1HM2 /bin/bash -ic "cd /home/gaoyu/evaluation/hbase-2.4.8/ && grep -r \"Processing expiration of c1rs2\" logs")
        echo "For the crash node $crashNodeIP, the recovery info is $hm1log and $hm2log."
        if [ "$hm1log" == "" ] && [ "$hm2log" == "" ]; then
           sh failTest.sh "The failure of node $crashNodeIP seems was not handled by HMaster!"
        fi
        ;;
      172.25.0.6)
        hm1log=$(docker exec -t C1HM1 /bin/bash -ic "cd /home/gaoyu/evaluation/hbase-2.4.8/ && grep -r \"Processing expiration of c1rs3\" logs")
        hm2log=$(docker exec -t C1HM2 /bin/bash -ic "cd /home/gaoyu/evaluation/hbase-2.4.8/ && grep -r \"Processing expiration of c1rs3\" logs")
        echo "For the crash node $crashNodeIP, the recovery info is $hm1log and $hm2log."
        if [ "$hm1log" == "" ] && [ "$hm2log" == "" ]; then
           sh failTest.sh "The failure of node $crashNodeIP seems was not handled by HMaster!"
        fi
        ;;
    esac
fi

if [ "$restarted" == "true" ]; then
    case $crashNodeIP in
      172.25.0.2)
        ;;
      172.25.0.3)
        ;;
      172.25.0.4)
        hm1log=$(docker exec -t C1HM1 /bin/bash -ic "cd /home/gaoyu/evaluation/hbase-2.4.8/ && grep -r \"Registering regionserver=c1rs1\" logs")
        hm2log=$(docker exec -t C1HM2 /bin/bash -ic "cd /home/gaoyu/evaluation/hbase-2.4.8/ && grep -r \"Registering regionserver=c1rs1\" logs")
        echo "For the crash node $crashNodeIP, the recovery info is $hm1log and $hm2log."
        if [ "$hm1log" == "" ] && [ "$hm2log" == "" ]; then
           sh failTest.sh "The failure of node $crashNodeIP seems was not handled by HMaster!"
        fi
        ;;
      172.25.0.5)
        hm1log=$(docker exec -t C1HM1 /bin/bash -ic "cd /home/gaoyu/evaluation/hbase-2.4.8/ && grep -r \"Registering regionserver=c1rs2\" logs")
        hm2log=$(docker exec -t C1HM2 /bin/bash -ic "cd /home/gaoyu/evaluation/hbase-2.4.8/ && grep -r \"Registering regionserver=c1rs2\" logs")
        echo "For the crash node $crashNodeIP, the recovery info is $hm1log and $hm2log."
        if [ "$hm1log" == "" ] && [ "$hm2log" == "" ]; then
           sh failTest.sh "The failure of node $crashNodeIP seems was not handled by HMaster!"
        fi
        ;;
      172.25.0.6)
        hm1log=$(docker exec -t C1HM1 /bin/bash -ic "cd /home/gaoyu/evaluation/hbase-2.4.8/ && grep -r \"Registering regionserver=c1rs3\" logs")
        hm2log=$(docker exec -t C1HM2 /bin/bash -ic "cd /home/gaoyu/evaluation/hbase-2.4.8/ && grep -r \"Registering regionserver=c1rs3\" logs")
        echo "For the crash node $crashNodeIP, the recovery info is $hm1log and $hm2log."
        if [ "$hm1log" == "" ] && [ "$hm2log" == "" ]; then
           sh failTest.sh "The failure of node $crashNodeIP seems was not handled by HMaster!"
        fi
        ;;
    esac
fi

sh checkException.sh

function checkC1RSs(){
nm1=$( docker exec -t C1RS1 bin/bash -ic 'cd /home/gaoyu/evaluation/hb-hadoop-3.2.2/nmdir && ls -lR |grep -v ^d|awk '{print $9}' |tr -s '\n'' )
nm2=$( docker exec -t C1RS2 bin/bash -ic 'cd /home/gaoyu/evaluation/hb-hadoop-3.2.2/nmdir && ls -lR |grep -v ^d|awk '{print $9}' |tr -s '\n'' )
nm3=$( docker exec -t C1RS3 bin/bash -ic 'cd /home/gaoyu/evaluation/hb-hadoop-3.2.2/nmdir && ls -lR |grep -v ^d|awk '{print $9}' |tr -s '\n'' )

if [[ "$nm1" != "" ]] || [[ "$nm2" != "" ]] || [[ "$nm3" != "" ]]; then
  echo "$nm1"
  sh failTest.sh "nmlogs are not null!"
fi   
}

#checkC1RSs

function checkJob(){
rst=$(docker exec -t NN /bin/bash -ic "cd /home/gaoyu/evaluation/hb-hadoop-3.2.2 && bin/hadoop fs -ls" )
hasOutput=$(echo $rst| grep "gyOutput")
if [[ "$hasOutput" != "" ]]; then
  rst=$(docker exec -t NN /bin/bash -ic "cd /home/gaoyu/evaluation/hb-hadoop-3.2.2 && bin/hadoop fs -ls gyOutput" )
  hasSuccess=$(echo $rst| grep "_SUCCESS")
  if [[ "$hasSuccess" == "" ]]; then
    sh failTest.sh "The job was failed!"
  fi
fi
}

#checkJob

jpsAll=$( sh jpsCluster.sh)
hasRunJar=$(echo $jpsAll| grep "JarBootstrapMain")
if [[ "$hasRunJar" != "" ]]; then
    sh failTest.sh "The client was not exit!"

fi

zkInfo=$( sh getZKInfo.sh )
hasFAVTable=$(echo $zkInfo | grep "FAVMyInfo")
if [[ "$hasFAVTable" != "" ]]; then
    sh failTest.sh "The FAVMyInfo node is still in ZK:$hasFAVTable"
fi

nonExistNode=$(echo $zkInfo | grep "Node does not exist")
if [[ "$nonExistNode" != "" ]]; then
    sh failTest.sh "There are nodes not exist in ZK:$nonExistNode"
fi
echo $zkInfo
