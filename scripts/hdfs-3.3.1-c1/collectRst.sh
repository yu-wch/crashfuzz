mkdir record-state
sh monitor.sh record-state

docker cp C1NN:/home/gaoyu/dfs331-fav-rst .
docker cp C1RM:/home/gaoyu/dfs331-fav-rst .
docker cp C1Master1:/home/gaoyu/dfs331-fav-rst .
docker cp C1Master2:/home/gaoyu/dfs331-fav-rst .
docker cp C1Slave1:/home/gaoyu/dfs331-fav-rst .
docker cp C1Slave2:/home/gaoyu/dfs331-fav-rst .
docker cp C1Slave3:/home/gaoyu/dfs331-fav-rst .
docker cp C1Slave4:/home/gaoyu/dfs331-fav-rst .
docker cp C1HS:/home/gaoyu/dfs331-fav-rst .
docker cp C1WPS:/home/gaoyu/dfs331-fav-rst .
mv dfs331-fav-rst fav-rst
