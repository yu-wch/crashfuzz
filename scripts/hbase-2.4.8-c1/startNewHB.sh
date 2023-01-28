sh clearHB.sh
sh stopHDFS.sh
sh startHDFS.sh
docker exec -t C1hb-zk /bin/bash -ic 'cd /home/gaoyu/evaluation/hb-zk-3.6.3/ && bin/zkCli.sh -server localhost:11181 deleteall /hbase'
#docker exec -t C1HM1 /bin/bash -ic '/etc/init.d/ssh start'
#docker exec -t C1HM2 /bin/bash -ic '/etc/init.d/ssh start'
#docker exec -t C1RS1 /bin/bash -ic '/etc/init.d/ssh start'
#docker exec -t C1RS2 /bin/bash -ic '/etc/init.d/ssh start'
#docker exec -t C1RS3 /bin/bash -ic '/etc/init.d/ssh start'

#docker exec -t NN /bin/bash -ic '/home/gaoyu/evaluation/hb-hadoop-3.2.2/bin/hdfs namenode -format mycluster'
docker exec -t C1HM1 /bin/bash -ic 'cd /home/gaoyu/evaluation/hbase-2.4.8/ && bin/start-hbase.sh && jps'
#docker exec -t RM2 /bin/bash -ic 'cd /home/gaoyu/evaluation/hb-hadoop-3.2.2/ && bin/yarn --daemon start resourcemanager'
#docker exec -t RM /bin/bash -ic 'cd /home/gaoyu/evaluation/hb-hadoop-3.2.2/ && bin/yarn rmadmin -getServiceState rm1'
#docker exec -t RM /bin/bash -ic 'cd /home/gaoyu/evaluation/hb-hadoop-3.2.2/ && bin/yarn rmadmin -getServiceState rm2'
#docker exec -t NM1 /bin/bash -ic 'cd /home/gaoyu/evaluation/hb-hadoop-3.2.2/ && bin/yarn --daemon start nodemanager && jps'
#docker exec -t NM2 /bin/bash -ic 'cd /home/gaoyu/evaluation/hb-hadoop-3.2.2/ && bin/yarn --daemon start nodemanager && jps'
#docker exec -t NM3 /bin/bash -ic 'cd /home/gaoyu/evaluation/hb-hadoop-3.2.2/ && bin/yarn --daemon start nodemanager && jps'
#docker exec -t WPS /bin/bash -ic 'cd /home/gaoyu/evaluation/hb-hadoop-3.2.2/ && bin/yarn --daemon start proxyserver && jps'
