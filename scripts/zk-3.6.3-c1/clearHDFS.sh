docker exec -t NN /bin/bash -ic 'cd /home/gaoyu/evaluation/hb-hadoop-2.10.1 && sh cleanhdfs.sh'

#docker exec -t RM1 /bin/bash -ic 'cd /home/gaoyu/evaluation/hb-hadoop-2.10.1 && sh cleanhdfs.sh'

#docker exec -t RM2 /bin/bash -ic 'cd /home/gaoyu/evaluation/hb-hadoop-2.10.1 && sh cleanhdfs.sh'

docker exec -t NM1 /bin/bash -ic 'cd /home/gaoyu/evaluation/hb-hadoop-2.10.1 && sh cleanhdfs.sh'

docker exec -t NM2 /bin/bash -ic 'cd /home/gaoyu/evaluation/hb-hadoop-2.10.1 && sh cleanhdfs.sh'

docker exec -t NM3 /bin/bash -ic 'cd /home/gaoyu/evaluation/hb-hadoop-2.10.1 && sh cleanhdfs.sh'
