## Setup

1. Build the qdisc kernel module:

`make`

2. Build the userspace tc component used to add/modify the qdisc

`./build-tc.sh`

3. Install the kernel module

`sudo insmod ./sch_bundle_inbox.ko`

4. Attach the qdisc (the parameters are the same as for tbf)

`sudo env TC_LIB_DIR=/PATH/TO/BUNDLER/iproute2/tc tc qdisc add dev [IFACE] root bundle_inbox rate [X]mbit burst [X/100]mbit latency 50ms`

- `/PATH/TO/BUNDLER` is the absolute path to this repository
- `IFACE` is the interface you want to capture traffic on
- `X` is the rate in Mbps (I've been using X/100 for burst, but this pretty arbitrary)
- Latency choice is also arbitrary and may need to be adjusted but seems to work well for now


## Requirements

This code was written for Linux v4.13 (default on Ubuntu 17.10). It should work with other versions,
but may require a slight modification to compile since the qdisc API changed slightly.
