## Environment Setup

We provide docker images to build a ZooKeeper cluster for CrashFuzz.
And we use ZooKeeper as an example to run CrashFuzz.

### Install CrashFuzz

Make a directory `crashfuzz` in your host machine (See
[REQUIREMENTS.md], tested on Ubuntu):

```bash
mkdir ~/crashfuzz
```

Copy `scripts/zk-3.6.3-c1` in our artifact package to `~/crashfuzz`.

Navigate to the `zk-3.6.3-c1` directory:

```bash
cd ~/crashfuzz/zk-3.6.3-c1
```

Execute `chmod 777 <file.sh>` for the scripts in the
`~/crashfuzz/zk-3.6.3-c1` directory.

### Pull Images from Dockerhub

You can download the Docker images from Dockerhub by using the
following commands

```bash
docker pull world4gaoyu/c1zk1
# Rename the image to be consistent with our scripts
docker tag world4gaoyu/c1zk1 c1zk1

docker pull world4gaoyu/c1zk2
# Rename the image to be consistent with our scripts
docker tag world4gaoyu/c1zk2 c1zk2

docker pull world4gaoyu/c1zk3
# Rename the image to be consistent with our scripts
docker tag world4gaoyu/c1zk3 c1zk3

docker pull world4gaoyu/c1zk4
# Rename the image to be consistent with our scripts
docker tag world4gaoyu/c1zk4 c1zk4

docker pull world4gaoyu/c1zk5
# Rename the image to be consistent with our scripts
docker tag world4gaoyu/c1zk5 c1zk5
```

### Using the Docker Images

Use docker images to build a ZooKeeper cluster with five nodes
(execute as a root user):

```bash
sh ~/crashfuzz/zk-3.6.3-c1/buildCluster.sh
```

Note that before executing buildCluster.sh, make sure you do not have a docker network which is named as fav-zookeeper1 and the IP range 172.30.0.0/16 is not occupied.

If you did not install firewalld in your machine, you may not need to run the following commands in `buildCluster.sh`. Just make sure the host machine can communicate with the nodes in the ZooKeeper cluster.

```
firewall-cmd --permanent --zone=public --add-rich-rule='rule family=ipv4 source address=172.30.0.0/16 accept'
firewall-cmd --reload
```

Append the following content to `/etc/hosts` and make sure the host machine can identify the nodes in the ZooKeeper cluster.

```
172.30.0.2      C1ZK1 C1ZK1.fav-zookeeper1
172.30.0.3      C1ZK2 C1ZK2.fav-zookeeper1
172.30.0.4      C1ZK3 C1ZK3.fav-zookeeper1
172.30.0.5      C1ZK4 C1ZK4.fav-zookeeper1
172.30.0.6      C1ZK5 C1ZK5.fav-zookeeper1
```

## Testing the Setup

Run the following commands to start CrashFuzz:

```bash
cd ~/crashfuzz/zk-3.6.3-c1
sh crashfuzz.sh
```

Run the following commands to start the alternative approach
CrashFuzz$^-$ used in our evaluation:

```bash
cd ~/crashfuzz/zk-3.6.3-c1
sh crashfuzz_minus.sh
```

Run the following commands to start the alternative approach
BruteForce used in our evaluation:

```bash
cd ~/crashfuzz/zk-3.6.3-c1
sh brute.sh
```

Run the following commands to start the alternative approach
Random used in our evaluation:

```bash
cd ~/crashfuzz/zk-3.6.3-c1
sh random.sh
```

**NOTE**: CrashFuzz logs information about the start of a fault injection test, the injection of a node crash/reboot, observed failure symptoms, potential bugs and so on. For example, `Going to conduct test *` means a new fault injection test is started. `Find a BUG for test *` means a potential bug is triggered. `INFO - Prepare to crash node *` means CrashFuzz is going to inject a node crash fault. Note that some errors and exceptions may show up when running CrashFuzz, and this may not mean that CrashFuzz runs incorrectly. For example, after crashing a ZooKeeper node, we may encounter the container not running error when checking the status of the target system. CrashFuzz users need a certain understanding of the target distributed system to decide whether the errors and exceptions are expected.
