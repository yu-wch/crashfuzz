rs=$1


if [[ "$rs" =~ "C1RS1" ]] || [[ "$rs" =~ "c1rs1" ]] || [[ "$rs" =~ "172.25.0.4" ]]; then
  sh crashNode.sh 172.25.0.4
  sh startNode.sh 172.25.0.4
elif [[ "$rs" =~ "C1RS2" ]] || [[ "$rs" =~ "c1rs2" ]] || [[ "$rs" =~ "172.25.0.5" ]]; then
  sh crashNode.sh 172.25.0.5
  sh startNode.sh 172.25.0.5
elif [[ "$rs" =~ "C1RS3" ]] || [[ "$rs" =~ "*c1rs3*" ]] || [[ "$rs" =~ "172.25.0.6" ]]; then
  sh crashNode.sh 172.25.0.6
  sh startNode.sh 172.25.0.6
fi

sh jpsCluster.sh
