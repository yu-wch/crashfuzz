mkdir trigger-tmp
sh monitor.sh trigger-tmp
#cp -r zk1-c1/trace5/record-state trigger-tmp

java -cp slf4j-api-1.7.25.jar:zookeeper-3.6.3.jar:zookeeper-jute-3.6.3.jar org.apache.zookeeper.server.LogFormatter trigger-tmp/C1ZK1/zkData/version-2/log.100000001 | awk '{$1=$2=""; print $0}' > tmpZK1Data
node1Data=$(md5sum tmpZK1Data | awk '{print $1}')

java -cp slf4j-api-1.7.25.jar:zookeeper-3.6.3.jar:zookeeper-jute-3.6.3.jar org.apache.zookeeper.server.LogFormatter trigger-tmp/C1ZK2/zkData/version-2/log.100000001 | awk '{$1=$2=""; print $0}' > tmpZK2Data
node2Data=$(md5sum tmpZK2Data | awk '{print $1}')

java -cp slf4j-api-1.7.25.jar:zookeeper-3.6.3.jar:zookeeper-jute-3.6.3.jar org.apache.zookeeper.server.LogFormatter trigger-tmp/C1ZK3/zkData/version-2/log.100000001 | awk '{$1=$2=""; print $0}' > tmpZK3Data
node3Data=$(md5sum tmpZK3Data | awk '{print $1}')

if [ "$node1Data" != "$node2Data" ] || [ "$node3Data" != "$node2Data" ] || [ "$node1Data" != "$node3Data" ];then
 sh failTest.sh "data logs are inconsistent: $node1Data , $node2Data , $node3Data"
 echo "C1ZK1 data:"
 cat tmpZK1Data
 printf "\n"
 echo "C1ZK2 data:"
 cat tmpZK2Data
 printf "\n"
 echo "C1ZK3 data:"
 cat tmpZK3Data
 printf "\n"
fi

rm tmpZK1Data
rm tmpZK2Data
rm tmpZK3Data
rm -rf trigger-tmp
