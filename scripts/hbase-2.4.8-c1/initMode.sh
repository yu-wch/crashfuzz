rm -r conf
cp -r conf-init conf
#rm fav-env.sh
#cp fav-env-rec.sh fav-env.sh

#docker cp fav-env.sh NN:/home/gaoyu/evaluation/hb-hadoop-3.2.2
docker cp conf C1HM1:/home/gaoyu/evaluation/hbase-2.4.8

#docker cp fav-env.sh RM1:/home/gaoyu/evaluation/hb-hadoop-3.2.2
docker cp conf C1HM2:/home/gaoyu/evaluation/hbase-2.4.8

#docker cp fav-env.sh NM1:/home/gaoyu/evaluation/hb-hadoop-3.2.2
docker cp conf C1RS1:/home/gaoyu/evaluation/hbase-2.4.8

#docker cp fav-env.sh NM2:/home/gaoyu/evaluation/hb-hadoop-3.2.2
docker cp conf C1RS2:/home/gaoyu/evaluation/hbase-2.4.8

#docker cp fav-env.sh NM3:/home/gaoyu/evaluation/hb-hadoop-3.2.2
docker cp conf C1RS3:/home/gaoyu/evaluation/hbase-2.4.8

#docker cp fav-env.sh yarn-zk:/home/gaoyu/evaluation/zk-3.6.1
