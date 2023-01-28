export MSG_OPT=false
#export PHOS_OPTS="-Xbootclasspath/a:/home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar -javaagent:/home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar=useFav=false,hbaseRpc=true,cacheDir=/home/gaoyu/evaluation/hbase-1.7.1/favcache"
export PHOS_OPTS="-Xbootclasspath/a:/home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar -javaagent:/home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar=useFav=false,useMsgid=false,jdkMsg=false"
#export PHOS_OPTS="-Xbootclasspath/a:/home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar -javaagent:/home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar=useFav=false"
#export FAV_OPTS="$PHOS_OPTS"

export FAV_OPTS="-Xbootclasspath/a:/home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar -javaagent:/home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar=useFav=true,useMsgid=false,jdkMsg=false,jdkFile=true,recordPhase=true,recordPath=/home/gaoyu/zk363-fav-rst/,dataPaths=/home/gaoyu/evaluation/zk-3.6.3/zkData/version-2,cacheDir=/home/gaoyu/CacheFolder,favHome=/home/gaoyu,hdfsApi=false,forZk=true,forHbase=false,isThirdPartyProto=false"
export TIME_OPTS="-Dfile.encoding=UTF8 -Duser.timezone=GMT+08"
