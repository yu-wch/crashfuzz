sh run.sh

docker exec -it C1HM1 /bin/bash -ic 'sh /home/gaoyu/clean.sh'
docker cp Phosphor-0.0.5-SNAPSHOT.jar C1HM1:/home/gaoyu
#docker exec -it C1HM1 /bin/bash -ic 'sh /home/gaoyu/buildJRE.sh'
docker cp fav-jre-inst C1HM1:/home/gaoyu

docker exec -it C1HM2 /bin/bash -ic 'sh /home/gaoyu/clean.sh'
docker cp Phosphor-0.0.5-SNAPSHOT.jar C1HM2:/home/gaoyu
docker cp fav-jre-inst C1HM2:/home/gaoyu

docker exec -it C1RS1 /bin/bash -ic 'sh /home/gaoyu/clean.sh'
docker cp Phosphor-0.0.5-SNAPSHOT.jar C1RS1:/home/gaoyu
docker cp fav-jre-inst C1RS1:/home/gaoyu

docker exec -it C1RS2 /bin/bash -ic 'sh /home/gaoyu/clean.sh'
docker cp Phosphor-0.0.5-SNAPSHOT.jar C1RS2:/home/gaoyu
docker cp fav-jre-inst C1RS2:/home/gaoyu

docker exec -it C1RS3 /bin/bash -ic 'sh /home/gaoyu/clean.sh'
docker cp Phosphor-0.0.5-SNAPSHOT.jar C1RS3:/home/gaoyu
docker cp fav-jre-inst C1RS3:/home/gaoyu

docker exec -it C1hb-cli /bin/bash -ic 'sh /home/gaoyu/clean.sh'
#docker exec -it C1hb-hdfs /bin/bash -ic 'rm /home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar'
docker cp Phosphor-0.0.5-SNAPSHOT.jar C1hb-cli:/home/gaoyu
docker cp fav-jre-inst C1hb-cli:/home/gaoyu
