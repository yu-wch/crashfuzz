rm -r etc
#cp -r etc-init etc
cp -r etc-dfs1-init etc
#cp -r etc-dfs2-init etc

docker cp etc C1NN:/home/gaoyu/evaluation/hadoop-3.3.1

docker cp etc C1RM:/home/gaoyu/evaluation/hadoop-3.3.1

docker cp etc C1Master1:/home/gaoyu/evaluation/hadoop-3.3.1

docker cp etc C1Master2:/home/gaoyu/evaluation/hadoop-3.3.1

docker cp etc C1Slave1:/home/gaoyu/evaluation/hadoop-3.3.1

docker cp etc C1Slave2:/home/gaoyu/evaluation/hadoop-3.3.1

docker cp etc C1Slave3:/home/gaoyu/evaluation/hadoop-3.3.1

docker cp etc C1Slave4:/home/gaoyu/evaluation/hadoop-3.3.1

docker cp etc C1HS:/home/gaoyu/evaluation/hadoop-3.3.1

docker cp etc C1WPS:/home/gaoyu/evaluation/hadoop-3.3.1
