function waitLeader(){
start=$(date +%s)

while [ 0 -le 5 ]
do

echo "***********************polling nodes for a leader"

rst=$( docker exec -t C1ZK1 /bin/bash -ic "cd /home/gaoyu/evaluation/zk-3.6.3 && bin/zkServer.sh status" | grep "leader")
if [[ "$rst" != "" ]]; then
  echo "leader is C1ZK1"
  leader="C1ZK1"
  break
fi

rst=$( docker exec -t C1ZK2 /bin/bash -ic "cd /home/gaoyu/evaluation/zk-3.6.3 && bin/zkServer.sh status" | grep "leader" )
if [[ "$rst" != "" ]]; then
  echo "leader is C1ZK2"
  leader="C1ZK2"
  break
fi

rst=$( docker exec -t C1ZK3 /bin/bash -ic "cd /home/gaoyu/evaluation/zk-3.6.3 && bin/zkServer.sh status" | grep "leader" )
if [[ "$rst" != "" ]]; then
  echo "leader is C1ZK3"
  leader="C1ZK3"
  break
fi
<<COMMENT
rst=$( docker exec -t C1ZK4 /bin/bash -ic "cd /home/gaoyu/evaluation/zk-3.6.3 && bin/zkServer.sh status" | grep "leader" )
if [[ "$rst" != "" ]]; then
  echo "leader is C1ZK4"
  leader="C1ZK4"
  break
fi

rst=$( docker exec -t C1ZK5 /bin/bash -ic "cd /home/gaoyu/evaluation/zk-3.6.3 && bin/zkServer.sh status" | grep "leader" )
if [[ "$rst" != "" ]]; then
  echo "leader is C1ZK5"
  leader="C1ZK5"
  break
fi
COMMENT
end=$(date +%s)
#take=$(( end - start ))
let start_=10#${start}
let end_=10#${end}
take=$(( end_ - start_ ))/60

if [[ $take -ge 10 ]]; then
  sh failTest.sh "The leader didn't online in 10 mins!"
  sh jpsCluster.sh
  exit 0
  break

fi

done
}

leader=""
waitLeader
echo "The leader has been online!!!"

