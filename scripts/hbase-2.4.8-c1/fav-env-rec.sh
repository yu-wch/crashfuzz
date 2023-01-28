export MSG_OPT=false
#export PHOS_OPTS="-Xbootclasspath/a:/home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar -javaagent:/home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar=useFav=false,hbaseRpc=true,cacheDir=/home/gaoyu/evaluation/hbase-2.4.8/favcache"
export PHOS_OPTS="-Xbootclasspath/a:/home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar -javaagent:/home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar=useFav=false,hbaseRpc=true"
#export PHOS_OPTS="-Xbootclasspath/a:/home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar -javaagent:/home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar=useFav=false"
#export FAV_OPTS="$PHOS_OPTS"

export FAV_OPTS="-Xbootclasspath/a:/home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar -javaagent:/home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar=useFav=true,useMsgid=false,jdkMsg=false,jdkFile=true,recordPhase=true,recordPath=/home/gaoyu/hb244-fav-rst/,dataPaths=/home/gaoyu/evaluation/hbase-2.4.8/tmp:/home/gaoyu/evaluation/hbase-2.4.8/conf,cacheDir=/home/gaoyu/HB244-CacheFolder,favHome=/home/gaoyu,hdfsApi=true,zkApi=true,forHbase=true"
export TIME_OPTS="-Dfile.encoding=UTF8 -Duser.timezone=GMT+08"
