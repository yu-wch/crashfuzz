sh clearHB.sh
#sh stopHDFS.sh
#sh startHDFS.sh
#docker exec -t C1hb-zk /bin/bash -ic 'cd /home/gaoyu/evaluation/hb-zk-3.6.3/ && bin/zkClient -server localhost:11181 deleteall /hbase'
#docker exec -t C1HM1 /bin/bash -ic '/etc/init.d/ssh start'
#docker exec -t C1HM2 /bin/bash -ic '/etc/init.d/ssh start'
#docker exec -t C1RS1 /bin/bash -ic '/etc/init.d/ssh start'
#docker exec -t C1RS2 /bin/bash -ic '/etc/init.d/ssh start'
#docker exec -t C1RS3 /bin/bash -ic '/etc/init.d/ssh start'

docker exec -t C1HM1 /bin/bash -ic 'cd /home/gaoyu/evaluation/hbase-2.4.8/ && bin/start-hbase.sh && jps'
