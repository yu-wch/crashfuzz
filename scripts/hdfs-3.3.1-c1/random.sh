#random crash inject
java -cp VerifyBug-0.0.1-SNAPSHOT.jar edu.iscas.randomcrash.RandomCrashMain 89 "172.28.0.2;172.28.0.4;172.28.0.6;172.28.0.7;172.28.0.8" "random.properties"

sh restartAllDockers.sh

