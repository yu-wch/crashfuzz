function startDocker(){
rst=$( docker restart $1 )
error=$(echo $rst| grep "Error response from daemon")
if [[ "$error" != "" ]]; then
  docker restart $1
fi
}

startDocker NN
sleep 5
#docker restart RM1
startDocker RM1
sleep 5
#docker restart RM2
startDocker RM2
sleep 5
#docker restart WPS
startDocker WPS
sleep 5
#docker restart HS
startDocker HS
sleep 5
#docker restart NM1
startDocker NM1
sleep 5
#docker restart NM2
startDocker NM2
sleep 5
#docker restart NM3
startDocker NM3
