#### Dpdk Scripts

Scripts to install and use DPDK packet generator. 

##### Installation
1. ./installDpdk.sh -- install dpdk to ./dpdkInstall/dpdk-stable-17.08.1 (with connectx4 drivers)
2. ./installPktgen.sh -- install pkt generator to ./dpdkInstall/pktgen-3.4.9 (with 1 GB for pcap rx)

##### Usage
1. ./runPktGen.sh -- start pktGen cli using 3 cores: 1 core to display the CPI, 1 core to send packets out of the first ethernet interface available to DPDK, and 1 core to recieve packets on that same interface.

*note:* pktGen needs a large terminal window to display properly.

##### Using the pktgen cli

Once pktGen initializes it will launch a large cli that displays a per-interface column. Look at the third row from the top ("link state") to determine if the link is up. It should say something like ```<UP-25000-FD>``` if the port is up.

A few important commands: 

```set <PORTNUM> rate <PCT>```
- sets port <PORTNUM> to generate traffic at <PCT> of its capacity in throughput.
- PCT can be a fraction. 
- on a 25 Gb/s link, ```set 0 rate .538579``` will be about 200K packets per second with 64B packets.

```set <PORTNUM> burst <VAL>```
- sets port <PORTNUM> to send packets in bursts of size <VAL>. For evenly spaced packets, you want this to be 1.

```start <PORTNUM> ```
- start generating traffic on <PORTNUM>

```stop <PORTNUM> ```
- stop generating traffic on <PORTNUM>

```quit```
- exit dpdk-pktgen

**See https://pktgen-dpdk.readthedocs.io/en/latest/commands.html#runtime-options-and-commands for commands to set all kinds of other options.**





##### Old readme notes (out of date)
2. ./runThroughput.sh -- run pktGen with a script to send packets out of port 1 and count packets on port 2 for 10 seconds.
2. ./runPcapThroughput.sh -- run pktGen with a script to send packets from pcaps/iperfClient2Server.pcap out of port 1 and count packets on port 2 for 10 seconds. Pcap is loaded into memory and looped.

##### pktgen scripts
runThroughput.sh and runPcapThroughput.sh use luaScripts/throughput.lua.

Read the getting started guide for more information on how to use pktGen: 
http://pktgen-dpdk.readthedocs.io/en/latest/running.html

and more about command line options:
http://pktgen-dpdk.readthedocs.io/en/latest/usage_pktgen.html
