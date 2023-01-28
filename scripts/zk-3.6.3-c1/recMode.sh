rm -rf conf
rm -rf bin
cp -r conf-rec-3nodes conf
#cp -r conf-rec-5nodes conf
cp -r bin-rec bin
rm fav-env.sh
cp fav-env-rec.sh fav-env.sh

docker cp fav-env.sh C1ZK1:/home/gaoyu/evaluation/zk-3.6.3
docker cp conf C1ZK1:/home/gaoyu/evaluation/zk-3.6.3
docker cp bin C1ZK1:/home/gaoyu/evaluation/zk-3.6.3
docker cp zkData C1ZK1:/home/gaoyu/evaluation/zk-3.6.3
docker exec -t C1ZK1 /bin/bash -ic "cd /home/gaoyu/evaluation/zk-3.6.3 && echo 1 > zkData/myid"

docker cp fav-env.sh C1ZK2:/home/gaoyu/evaluation/zk-3.6.3
docker cp conf C1ZK2:/home/gaoyu/evaluation/zk-3.6.3
docker cp bin C1ZK2:/home/gaoyu/evaluation/zk-3.6.3
docker cp zkData C1ZK2:/home/gaoyu/evaluation/zk-3.6.3
docker exec -t C1ZK2 /bin/bash -ic "cd /home/gaoyu/evaluation/zk-3.6.3 && echo 2 > zkData/myid"

docker cp fav-env.sh C1ZK3:/home/gaoyu/evaluation/zk-3.6.3
docker cp conf C1ZK3:/home/gaoyu/evaluation/zk-3.6.3
docker cp bin C1ZK3:/home/gaoyu/evaluation/zk-3.6.3
docker cp zkData C1ZK3:/home/gaoyu/evaluation/zk-3.6.3
docker exec -t C1ZK3 /bin/bash -ic "cd /home/gaoyu/evaluation/zk-3.6.3 && echo 3 > zkData/myid"

docker cp fav-env.sh C1ZK4:/home/gaoyu/evaluation/zk-3.6.3
docker cp conf C1ZK4:/home/gaoyu/evaluation/zk-3.6.3
docker cp bin C1ZK4:/home/gaoyu/evaluation/zk-3.6.3
docker cp zkData C1ZK4:/home/gaoyu/evaluation/zk-3.6.3
docker exec -t C1ZK4 /bin/bash -ic "cd /home/gaoyu/evaluation/zk-3.6.3 && echo 4 > zkData/myid"

docker cp fav-env.sh C1ZK5:/home/gaoyu/evaluation/zk-3.6.3
docker cp conf C1ZK5:/home/gaoyu/evaluation/zk-3.6.3
docker cp bin C1ZK5:/home/gaoyu/evaluation/zk-3.6.3
docker cp zkData C1ZK5:/home/gaoyu/evaluation/zk-3.6.3
docker exec -t C1ZK5 /bin/bash -ic "cd /home/gaoyu/evaluation/zk-3.6.3 && echo 5 > zkData/myid"

#C1ZK-cli as client
docker cp fav-env.sh C1ZK-cli:/home/gaoyu/evaluation/zk-3.6.3
docker cp conf C1ZK-cli:/home/gaoyu/evaluation/zk-3.6.3
docker cp bin C1ZK-cli:/home/gaoyu/evaluation/zk-3.6.3
