function waitHDFS(){
start=$(date +%s)

while [ 0 -le 5 ]
do

rst=$(docker exec -t C1Slave4 /bin/bash -ic 'cd /home/gaoyu/evaluation/hadoop-3.3.1/ && bin/hdfs dfsadmin -safemode get' | grep "Safe mode is OFF")

if [[ "$rst" != "" ]]; then

  break

fi

end=$(date +%s)
#take=$(( end - start ))
let start_=10#${start}
let end_=10#${end}
take=$(( end_ - start_ ))/60

if [[ $take -ge 10 ]]; then
  sh failTest.sh "The hdfs does not exit safe mode in 10 mins!"
  sh jpsCluster.sh
  exit 0
  break

fi

done
}

waitHDFS
echo "HDFS exists safe mode!"
