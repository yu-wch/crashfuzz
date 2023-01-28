export MSG_OPT=false
#export PHOS_OPTS="-Xbootclasspath/a:/home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar -javaagent:/home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar=useFav=false,hbaseRpc=true,cacheDir=/home/gaoyu/evaluation/hadoop-3.3.1/favcache"
export PHOS_OPTS="-Xbootclasspath/a:/home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar -javaagent:/home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar=useFav=false,hdfsRpc=true"
#export PHOS_OPTS="-Xbootclasspath/a:/home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar -javaagent:/home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar=useFav=false"
#export FAV_OPTS="$PHOS_OPTS"

export FAV_OPTS="-Xbootclasspath/a:/home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar -javaagent:/home/gaoyu/Phosphor-0.0.5-SNAPSHOT.jar=useFav=true,useMsgid=false,jdkMsg=false,jdkFile=true,recordPhase=true,recordPath=/home/gaoyu/dfs331-fav-rst/,dataPaths=/home/gaoyu/evaluation/hadoop-3.3.1/tmp:/home/gaoyu/evaluation/hadoop-3.3.1/etc/hadoop/core-site.xml:/home/gaoyu/evaluation/hadoop-3.3.1/etc/hadoop/hdfs-site.xml:/home/gaoyu/evaluation/hadoop-3.3.1/nndir:/home/gaoyu/evaluation/hadoop-3.3.1/dndir:/home/gaoyu/evaluation/hadoop-3.3.1/journal-local,cacheDir=/home/gaoyu/CacheFolder,favHome=/home/gaoyu,hdfsApi=false,zkApi=true,forHdfs=true"
export TIME_OPTS="-Dfile.encoding=UTF8 -Duser.timezone=GMT+08"
