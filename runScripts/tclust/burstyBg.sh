# sends packets to tclust2 @ 5 Gb/s for 30 seconds.
. ./setDpdkPaths.bash
./allocHugePages.sh
WORK_DIR=`pwd`
cd $PKTGEN_DIR
echo "WORK DIR: $WORK_DIR"
# -l <list of cores to use>
# -n <number of memory channels
# -m [cores for rx:cores for tx].[device #s to use (0 for first NIC)]
sudo ./app/x86_64-native-linuxapp-gcc/pktgen -l 0,1,2,3,4,5,6,7 -n 3 -w 08:00.1 -- -P -m "[1:2-7].[0]" -f $WORK_DIR/luaScripts/burstyBg.lua
