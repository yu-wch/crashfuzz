rm -r conf
cp -r conf-rec conf
#cp -r conf-phos conf
rm fav-env.sh
cp fav-env-play.sh fav-env.sh

docker cp fav-env.sh C1HM1:/home/gaoyu/evaluation/hbase-2.4.8
docker cp conf C1HM1:/home/gaoyu/evaluation/hbase-2.4.8

docker cp fav-env.sh C1HM2:/home/gaoyu/evaluation/hbase-2.4.8
docker cp conf C1HM2:/home/gaoyu/evaluation/hbase-2.4.8

docker cp fav-env.sh C1RS1:/home/gaoyu/evaluation/hbase-2.4.8
docker cp conf C1RS1:/home/gaoyu/evaluation/hbase-2.4.8

docker cp fav-env.sh C1RS2:/home/gaoyu/evaluation/hbase-2.4.8
docker cp conf C1RS2:/home/gaoyu/evaluation/hbase-2.4.8

docker cp fav-env.sh C1RS3:/home/gaoyu/evaluation/hbase-2.4.8
docker cp conf C1RS3:/home/gaoyu/evaluation/hbase-2.4.8

docker cp fav-env.sh C1hb-cli:/home/gaoyu/evaluation/hbase-2.4.8
docker cp conf C1hb-cli:/home/gaoyu/evaluation/hbase-2.4.8

docker cp allowlist C1HM1:/home/gaoyu/evaluation/hbase-2.4.8
docker cp allowlist C1HM2:/home/gaoyu/evaluation/hbase-2.4.8
docker cp allowlist C1RS1:/home/gaoyu/evaluation/hbase-2.4.8
docker cp allowlist C1RS2:/home/gaoyu/evaluation/hbase-2.4.8
docker cp allowlist C1RS3:/home/gaoyu/evaluation/hbase-2.4.8

docker cp denylist C1HM1:/home/gaoyu/evaluation/hbase-2.4.8
docker cp denylist C1HM2:/home/gaoyu/evaluation/hbase-2.4.8
docker cp denylist C1RS1:/home/gaoyu/evaluation/hbase-2.4.8
docker cp denylist C1RS2:/home/gaoyu/evaluation/hbase-2.4.8
docker cp denylist C1RS3:/home/gaoyu/evaluation/hbase-2.4.8
