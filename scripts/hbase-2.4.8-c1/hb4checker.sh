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
  checkAlive "C1RS3" "HRegionServer"
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
        hm1log=$(docker exec -t C1HM1 /bin/bash -ic "cd /home/gaoyu/evaluation/hbase-1.7.1/ && grep -r \"processing expiration \[c1rs1\" logs")
        hm2log=$(docker exec -t C1HM2 /bin/bash -ic "cd /home/gaoyu/evaluation/hbase-1.7.1/ && grep -r \"processing expiration \[c1rs1\" logs")
        echo "For the crash node $crashNodeIP, the recovery info is $hm1log and $hm2log."
        if [ "$hm1log" == "" ] && [ "$hm2log" == "" ]; then
           sh failTest.sh "The failure of node $crashNodeIP seems was not handled by HMaster!"
        fi
        ;;
     172.25.0.5)
        hm1log=$(docker exec -t C1HM1 /bin/bash -ic "cd /home/gaoyu/evaluation/hbase-1.7.1/ && grep -r \"processing expiration \[c1rs2\" logs")
        hm2log=$(docker exec -t C1HM2 /bin/bash -ic "cd /home/gaoyu/evaluation/hbase-1.7.1/ && grep -r \"processing expiration \[c1rs2\" logs")
        echo "For the crash node $crashNodeIP, the recovery info is $hm1log and $hm2log."
        if [ "$hm1log" == "" ] && [ "$hm2log" == "" ]; then
           sh failTest.sh "The failure of node $crashNodeIP seems was not handled by HMaster!"
        fi
        ;;
      172.25.0.6)
        hm1log=$(docker exec -t C1HM1 /bin/bash -ic "cd /home/gaoyu/evaluation/hbase-1.7.1/ && grep -r \"processing expiration \[c1rs2\" logs")
        hm2log=$(docker exec -t C1HM2 /bin/bash -ic "cd /home/gaoyu/evaluation/hbase-1.7.1/ && grep -r \"processing expiration \[c1rs2\" logs")
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
        let hm1log=10#$(docker exec -t C1HM1 /bin/bash -ic "cd /home/gaoyu/evaluation/hbase-1.7.1/ && grep -r \"Registering server=c1rs1\" logs | wc -l")
        let hm2log=10#$(docker exec -t C1HM2 /bin/bash -ic "cd /home/gaoyu/evaluation/hbase-1.7.1/ && grep -r \"Registering server=c1rs1\" logs | wc -l")
        echo "For the crash node $crashNodeIP, the recovery info is $hm1log and $hm2log."
        sum=$((hm1log + hm2log))
        if [[ $sum -le 1 ]]; then
           sh failTest.sh "The restart of node $crashNodeIP seems was not handled by HMaster!"
        fi
        ;;
      172.25.0.5)
        let hm1log=10#$(docker exec -t C1HM1 /bin/bash -ic "cd /home/gaoyu/evaluation/hbase-1.7.1/ && grep -r \"Registering server=c1rs2\" logs | wc -l")
        let hm2log=10#$(docker exec -t C1HM2 /bin/bash -ic "cd /home/gaoyu/evaluation/hbase-1.7.1/ && grep -r \"Registering server=c1rs2\" logs | wc -l")
        echo "For the crash node $crashNodeIP, the recovery info is $hm1log and $hm2log."
        sum=$((hm1log + hm2log))
        if [[ $sum -le 1 ]]; then
           sh failTest.sh "The restart of node $crashNodeIP seems was not handled by HMaster!"
        fi
        ;;
      172.25.0.6)
        let hm1log=10#$(docker exec -t C1HM1 /bin/bash -ic "cd /home/gaoyu/evaluation/hbase-1.7.1/ && grep -r \"Registering server=c1rs3\" logs | wc -l")
        let hm2log=10#$(docker exec -t C1HM2 /bin/bash -ic "cd /home/gaoyu/evaluation/hbase-1.7.1/ && grep -r \"Registering server=c1rs3\" logs | wc -l")
        sum=$((hm1log + hm2log))
        echo "For the crash node $crashNodeIP, the recovery info is $hm1log and $hm2log."
        if [[ $sum -le 1 ]]; then
           sh failTest.sh "The restart of node $crashNodeIP seems was not handled by HMaster!"
        fi
        ;;
    esac
fi

sh checkException.sh

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
