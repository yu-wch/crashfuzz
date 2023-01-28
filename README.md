# Artifact for "Coverage Guided Fault Injection for Cloud Systems", accepted at ICSE 2023

The artifact contains the instructions and scripts to re-run the evaluation
described in our paper. The artifact has the following structure:

* `scripts/`:
  This is the directory that contains the scripts needed to
  re-run the experiments presented in our paper.
* `crashfuzz/`: Contains the source code of the tool used in our paper
    for testing ZooKeeper, HBase and HDFS, namely `CrashFuzz`.
* `tool/`: Contains the tools `Phosphor-0.0.5-SNAPSHOT.jar` (used to
  instrument the target system, and run in every node of a target cluster) and
  `CCrashFuzzer-0.0.1-SNAPSHOT.jar` (used to run the main logic of
  CrashFuzz in a host machine).

Inside the `scripts` directory, there are the following directories


* `zk-3.6.3-c1/`: Some helper scripts for running `CrashFuzz` for
  ZooKeeper v3.6.3 or setting up the environment via Docker.
* `hbase-2.4.8-c1/`: Some helper scripts for running `CrashFuzz` for
  HBase v2.4.8 or setting up the environment via Docker.
* `hdfs-3.3.1-c1-new/`: Some helper scripts for running `CrashFuzz` for
  HDFS v3.3.1 or setting up the environment via Docker.

Inside the `crashfuzz` directory, there are the following directories


* `crashfuzz-inst/`: The source code of `CrashFuzz` used for
  instrumenting the target system.
* `crashfuzz-ctrl/`: The source code of `CrashFuzz` used for remaining
  logics.

Note that `crashfuzz` is available as open-source software under the
Apache License 2.0, and can also be reached through the following
Repository : https://github.com/theosotr/cynthia.

For any additional information, contact the first author by e-mail:
Dr. Yu Gao \<gaoyu15@otcaix.iscas.ac.cn\>

## Requirements

See [REQUIREMENTS.md](./REQUIREMENTS.md)

## Setup

See [INSTALL.md](./INSTALL.md)

## Getting Started

### Build Target Cluster

To get started with `CrashFuzz`, we should build a distributed cluster
for the target system (i.e., ZooKeeper, HBase or HDFS) with Docker in
a host machine. We provide Docker images for a distributed ZooKeeper cluster with
five nodes as an example. The Docker image is hosted at Docker
Hub (See ./INSTALL.md).

Then we should generate an instrumented version of the runtime
environment in every node of the target cluster. We can run the command 
`java -jar Deminer.jar -forJava <jre_path> <output_path>`
to prepare an instrumented JRE.

```
-forJava: Specify the instrumentation for JRE.
jre_path: Path for the input JRE.
output_path: Path for the instrumented JRE.
```

We can configure every node of the target system to use the
instrumented JRE and include the CrashFuzz as the Java agent with a
JVM argument for run time instrumentation. Take ZooKeeper as an
example. We can modify zkEnv.sh file and add following configuration:

```
JAVA = <instrumented_jre_path>/bin/java 
CRASHFUZZ_JVMFLAGS =
-Xbootclasspath/a:<CrashFuzz_path>/Phosphor-0.0.5-SNAPSHOT.jar
-javaagent:<CrashFuzz_path>/Phosphor-0.0.5-SNAPSHOT.jar
=useFav=true,forZk=true,
jdkFile=true,recordPath=<trace_path>,recordPath=<io_path>,covPath=<coverage_path>,
currentCrash=<current_fault_sequence_path>,controllerSocket=<host_ip:controller_port_number>,aflPort=<port_number_for_receiving_record_coverage_info>
```

The parameters are explained as follows: 

```
useFav: true for using CrashFuzz.
forZk: true for tracking ZooKeeper socket messages.
jdkFile: true for tracking reads/writes to local files.
```

### Run CrashFuzz

Then we should write a property file for the target system to specify
required paths and scripts, e.g., zk.properties. In the property file,
we should specify:

```
* WORKLOAD: The string path for the script used for running a workload.
* CRASH: The string path for the script used for crash a node in the
  target system according to the ip address.
* RESTART: The string path for the script used for restart a crash
  node according to the ip address.
* PRETREATMENT: The string path for the script used for prepare a
  clean environment for the target cluster before every fault
  injection test, e.g., remove stale data from last test.
* CHECKER: The string path for the script used for checking failure symptoms.
* MONITOR: The string path for the script used for collecting runtime
  information from the target cluster.
* CUR_CRASH_FILE: The string path for the file used for storing
  current fault sequence under test.
* UPDATE_CRASH: The string path for the script used for copying
  CUR_CRASH_FILE to each node of the target cluster.
* ROOT_DIR: The string path for the directory used for storing test
  outputs.
* TEST_TIME: To specify the test time.
* MAX_FAULTS: To specify the maximum number of faults in a fault sequence.
* FAULT_CSTR: To specify system-specify constraints, i.e., the number 
  of dead nodes should not exceed the maximum number of dead nodes that
  the target system can tolerate. For example,
  `2:{172.30.0.2,172.30.0.3,172.30.0.4,172.30.0.5,172.30.0.6}` means for
  a distributed cluster with five nodes (`172.30.0.2, 172.30.0.3,
  172.30.0.4, 172.30.0.5 and 172.30.0.6`), 
  it can tolerate the simultaneous downtime of two nodes at most.
* AFL_PORT: To specify the port number in a target cluster used for
  receiving the command from the controller to record coverage
  information.
* HANG_TMOUT: To specify the timeout period that used for confirming a
  hang bug.
```

We should customize scripts used in the property file for every target
system and workload. We show the scripts used in our evaluation in
`scripts/` directory.

Then, we can run the following command to start CrashFuzz:

```
java -cp CCrashFuzzer-0.0.1-SNAPSHOT.jar edu.iscas.CCrashFuzzer.CloudFuzzMain <controller_port_number> <property_file_path>
```

**NOTE**: Distributed systems run with nondeterminism, and CrashFuzz
combines random factors when selecting a fault sequence to test.
Therefore, we may not get exactly the same results as the experiment
in our paper.

## Example

We show an example to run CrashFuzz on ZooKeeper. You can follow
these steps:

1. Install CrashFuzz. See [INSTALL.md](./INSTALL.md)
2. Pull images from Dockerhub. See [INSTALL.md](./INSTALL.md)
3. Using the Docker images. See [INSTALL.md](./INSTALL.md)
4. Run CrashFuzz. See [INSTALL.md](./INSTALL.md)

We can check outputs of CrashFuzz and alternative approaches:

```bash
cd ~/crashfuzz/zk-3.6.3-c1/crashfuzz-outputs
cd ~/crashfuzz/zk-3.6.3-c1/crashfuzz_minus-outputs
cd ~/crashfuzz/zk-3.6.3-c1/brute-outputs
cd ~/crashfuzz/zk-3.6.3-c1/random-outputs
```

## Found Bugs

CrashFuzz has found five crash recovery bugs in three widely-used
cloud systems including [ZooKeeper v3.6.3](https://zookeeper.apache.org/), [HDFS v3.3.1](https://hadoop.apache.org/) 
and [HBase v2.4.6](https://hbase.apache.org/). 
The following table shows the bugs detected by CrashFuzz in these
systems for now.

| Bug ID                                                                 |     Failure Symptom      |
| ---------------------------------------------------------------------- | :----------------------: |
| [HBASE-26883](https://issues.apache.org/jira/browse/HBASE-26883)       |        Data loss         |
| [ZOOKEEPER-4503](https://issues.apache.org/jira/browse/ZOOKEEPER-4503) |      Data staleness      |
| [HBASE-26897](https://issues.apache.org/jira/browse/HBASE-26897)       |  Cluster out of service  |
| [HBASE-26370](https://issues.apache.org/jira/browse/HBASE-26370)       | Misleading error message |
| [HDFS-16508](https://issues.apache.org/jira/browse/HDFS-16508)         |    Operation failure     |