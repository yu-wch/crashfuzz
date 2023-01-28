docker exec -it C1ZK1 /bin/bash -ic 'rm /home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar'
docker cp Phosphor-0.0.5-SNAPSHOT.jar C1ZK1:/home/gaoyu

docker exec -it C1ZK2 /bin/bash -ic 'rm /home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar'
docker cp Phosphor-0.0.5-SNAPSHOT.jar C1ZK2:/home/gaoyu

docker exec -it C1ZK3 /bin/bash -ic 'rm /home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar'
docker cp Phosphor-0.0.5-SNAPSHOT.jar C1ZK3:/home/gaoyu

docker exec -it C1ZK4 /bin/bash -ic 'rm /home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar'
docker cp Phosphor-0.0.5-SNAPSHOT.jar C1ZK4:/home/gaoyu

docker exec -it C1ZK5 /bin/bash -ic 'rm /home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar'
docker cp Phosphor-0.0.5-SNAPSHOT.jar C1ZK5:/home/gaoyu

