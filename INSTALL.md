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