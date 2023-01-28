docker exec -it C1NN /bin/bash -ic 'rm /home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar'
docker cp Phosphor-0.0.5-SNAPSHOT.jar C1NN:/home/gaoyu

docker exec -it C1RM /bin/bash -ic 'rm /home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar'
docker cp Phosphor-0.0.5-SNAPSHOT.jar C1RM:/home/gaoyu

docker exec -it C1Master1 /bin/bash -ic 'rm /home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar'
docker cp Phosphor-0.0.5-SNAPSHOT.jar C1Master1:/home/gaoyu

docker exec -it C1Master2 /bin/bash -ic 'rm /home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar'
docker cp Phosphor-0.0.5-SNAPSHOT.jar C1Master2:/home/gaoyu

docker exec -it C1Slave1 /bin/bash -ic 'rm /home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar'
docker cp Phosphor-0.0.5-SNAPSHOT.jar C1Slave1:/home/gaoyu

docker exec -it C1Slave2 /bin/bash -ic 'rm /home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar'
docker cp Phosphor-0.0.5-SNAPSHOT.jar C1Slave2:/home/gaoyu

docker exec -it C1Slave3 /bin/bash -ic 'rm /home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar'
docker cp Phosphor-0.0.5-SNAPSHOT.jar C1Slave3:/home/gaoyu

docker exec -it C1Slave4 /bin/bash -ic 'rm /home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar'
docker cp Phosphor-0.0.5-SNAPSHOT.jar C1Slave4:/home/gaoyu

docker exec -it C1HS /bin/bash -ic 'rm /home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar'
docker cp Phosphor-0.0.5-SNAPSHOT.jar C1HS:/home/gaoyu

docker exec -it C1WPS /bin/bash -ic 'rm /home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar'
docker cp Phosphor-0.0.5-SNAPSHOT.jar C1WPS:/home/gaoyu
