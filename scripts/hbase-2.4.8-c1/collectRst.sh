mkdir record-state
sh monitor.sh record-state

docker cp C1HM1:/home/gaoyu/hb244-fav-rst .
docker cp C1HM2:/home/gaoyu/hb244-fav-rst .
docker cp C1RS1:/home/gaoyu/hb244-fav-rst .
docker cp C1RS2:/home/gaoyu/hb244-fav-rst .
docker cp C1RS3:/home/gaoyu/hb244-fav-rst .
mv hb244-fav-rst fav-rst
