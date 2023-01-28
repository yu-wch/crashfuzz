
docker network create --subnet=172.30.0.0/16 fav-zookeeper1

docker run --name C1ZK1 -v /etc/localtime:/etc/localtime:ro --network fav-zookeeper1 --hostname C1ZK1 --ip 172.30.0.2 -itd c1zk1

docker run --name C1ZK2 -v /etc/localtime:/etc/localtime:ro --network fav-zookeeper1 --hostname C1ZK2 --ip 172.30.0.3 -itd c1zk2

docker run --name C1ZK3 -v /etc/localtime:/etc/localtime:ro --network fav-zookeeper1 --hostname C1ZK3 --ip 172.30.0.4 -itd c1zk3

docker run --name C1ZK4 -v /etc/localtime:/etc/localtime:ro --network fav-zookeeper1 --hostname C1ZK4 --ip 172.30.0.5 -itd c1zk4

docker run --name C1ZK5 -v /etc/localtime:/etc/localtime:ro --network fav-zookeeper1 --hostname C1ZK5 --ip 172.30.0.6 -itd c1zk5

firewall-cmd --permanent --zone=public --add-rich-rule='rule family=ipv4 source address=172.30.0.0/16 accept'
firewall-cmd --reload
