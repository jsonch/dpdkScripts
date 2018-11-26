. ./setDpdkPaths.bash
./allocHugePages.sh
WORK_DIR=`pwd`
cd $PKTGEN_DIR

PCAP_FILE=/home/jsonch/gits/P4Boosters/cpuBoosters/pcaps/tofinoProcessed_iperfClient2Server.pcap

# -l <list of cores to use>
# -n <number of memory channels (always for for dell 720s)
# -m [cores for rx:cores for tx].[device #s to use (0 for first NIC)]
sudo ./app/x86_64-native-linuxapp-gcc/pktgen -l 0,1 -n 4 -w 08:00.1 -- -P -m "[1].[0]" -s 0:$PCAP_FILE
