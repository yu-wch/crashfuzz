
#. /data/gaoyu/crashfuzzer/hbase-2.4.8-c1/fav-env.sh
export PHOS_OPTS="-Xbootclasspath/a:Phosphor-0.0.5-SNAPSHOT.jar -javaagent:Phosphor-0.0.5-SNAPSHOT.jar=useFav=false,hbaseRpc=true"
fav-jre-inst/bin/java $PHOS_OPTS -cp hbcases.jar com.iscas.HBaseCases.Case1 172.25.0.8 11181 notcheck start stop check

#java -cp hbcases.jar com.iscas.HBaseCases.Case1 172.25.0.8 11181
