mkdir record-state
sh monitor.sh record-state

docker cp C1ZK1:/home/gaoyu/zk363-fav-rst .
docker cp C1ZK2:/home/gaoyu/zk363-fav-rst .
docker cp C1ZK3:/home/gaoyu/zk363-fav-rst .
docker cp C1ZK4:/home/gaoyu/zk363-fav-rst .
docker cp C1ZK5:/home/gaoyu/zk363-fav-rst .

mv zk363-fav-rst fav-rst
