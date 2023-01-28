#docker exec -it NN /bin/bash -ic 'rm /home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar'
#docker cp Phosphor-0.0.5-SNAPSHOT.jar NN:/home/gaoyu

docker exec -it C1HM1 /bin/bash -ic 'rm /home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar'
docker cp Phosphor-0.0.5-SNAPSHOT.jar C1HM1:/home/gaoyu

docker exec -it C1HM2 /bin/bash -ic 'rm /home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar'
docker cp Phosphor-0.0.5-SNAPSHOT.jar C1HM2:/home/gaoyu

#docker exec -it HS /bin/bash -ic 'rm /home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar'
#docker cp Phosphor-0.0.5-SNAPSHOT.jar HS:/home/gaoyu

#docker exec -it WPS /bin/bash -ic 'rm /home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar'
#docker cp Phosphor-0.0.5-SNAPSHOT.jar WPS:/home/gaoyu

docker exec -it C1RS1 /bin/bash -ic 'rm /home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar'
docker cp Phosphor-0.0.5-SNAPSHOT.jar C1RS1:/home/gaoyu

docker exec -it C1RS2 /bin/bash -ic 'rm /home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar'
docker cp Phosphor-0.0.5-SNAPSHOT.jar C1RS2:/home/gaoyu

docker exec -it C1RS3 /bin/bash -ic 'rm /home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar'
docker cp Phosphor-0.0.5-SNAPSHOT.jar C1RS3:/home/gaoyu

docker exec -it C1hb-cli /bin/bash -ic 'rm /home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar'
docker cp Phosphor-0.0.5-SNAPSHOT.jar C1hb-cli:/home/gaoyu
#docker exec -it yarn-zk /bin/bash -ic 'rm /home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar'
#docker cp Phosphor-0.0.5-SNAPSHOT.jar yarn-zk:/home/gaoyu
