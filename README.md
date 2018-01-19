#### Dpdk Scripts ####

Scripts to install and use DPDK packet generator. 

##### Installation #####
1. ./installDpdk.sh -- install dpdk to ./dpdkInstall/dpdk-stable-16.11.4
2. ./installPktgen.sh -- install pkt generator to ./dpdkInstall/pktgen-3.4.2

##### Usage #####
1. ./runPktGen.sh -- start pktGen using 2 cores for rx and 2 cores for tx on the first ethernet interface available to DPDK (i.e., the mellanox cards).
*note:* pktGen needs a large terminal window to display properly.

Read the getting started guide for more information on how to use pktGen: 
http://pktgen-dpdk.readthedocs.io/en/latest/running.html

and more about command line options:
http://pktgen-dpdk.readthedocs.io/en/latest/usage_pktgen.html