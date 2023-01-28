function kill {
        #nodeName=$(docker network inspect hadoop | grep -B 5 "$1" | grep Name | awk -F"\"" '{print $4}')
        nodeName=""
        daemonName=""
        isActive=""
        case $1 in
           172.25.0.2)
              nodeName="C1HM1"
              daemonName="resourcemanager"
              activeRst="$( docker exec -t C1HM1 /bin/bash -ic 'cd /home/gaoyu/evaluation/hb-hadoop-3.2.2/ && bin/yarn rmadmin -getServiceState rm1' )"
              rst=$(echo $activeRst| grep "active")
              echo "Goint to kill node C1HM1, active?: $rst"
              docker kill $nodeName
              sleep 30
              if [[ "$rst" != "" ]]; then
                activeRst="$( docker exec -t C1HM2 /bin/bash -ic 'cd /home/gaoyu/evaluation/hb-hadoop-3.2.2/ && bin/yarn rmadmin -getServiceState rm2' )"
                rst=$(echo $activeRst| grep "active")
                if [[ "$rst" == "" ]]; then
                   sh failTest.sh "nodemanager fail to failover to C1HM2"
                fi
              fi
              ;;
        case $1 in
           172.25.0.3)
              nodeName="C1HM2"
              daemonName="resourcemanager"
              activeRst="$( docker exec -t C1HM2 /bin/bash -ic 'cd /home/gaoyu/evaluation/hb-hadoop-3.2.2/ && bin/yarn rmadmin -getServiceState rm2' )"
              rst=$(echo $activeRst| grep "active")
              echo "Goint to kill node C1HM2, active?: $rst"
              docker kill $nodeName
              sleep 30
              if [[ "$rst" != "" ]]; then
                activeRst="$( docker exec -t C1HM1 /bin/bash -ic 'cd /home/gaoyu/evaluation/hb-hadoop-3.2.2/ && bin/yarn rmadmin -getServiceState rm1' )"
                if [[ "$rst" == "" ]]; then
                   sh failTest.sh "nodemanager fail to failover to C1HM1"
                fi 
              fi
              ;;
        case $1 in
           172.25.0.5)
              nodeName="C1RS1"
              daemonName="nodemanager"
              echo "Going to kill node $nodeName"
              docker kill $nodeName
              sleep 30
              ;;
        case $1 in
           172.25.0.6)
              nodeName="C1RS2"
              daemonName="nodemanager"
              echo "Going to kill node $nodeName"
              docker kill $nodeName
              sleep 30
              ;;
        case $1 in
           172.25.0.7)
              nodeName="C1RS3"
              daemonName="nodemanager"
              echo "Going to kill node $nodeName"
              docker kill $nodeName
              sleep 30
              ;;
        esac
}

kill $1
#sleep 30
