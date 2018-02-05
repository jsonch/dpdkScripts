. ./setDpdkPaths.bash
./allocHugePages.sh
WORK_DIR=`pwd`
cd $PKTGEN_DIR
# -l <list of cores to use>
# -n <number of memory channels (always for for dell 720s)
# -m [cores for rx:cores for tx].[device #s to use (0 for first NIC)]
sudo ./app/app/x86_64-native-linuxapp-gcc/pktgen -l 0,1,2,3,4 -n 4 -w 42:00.1 -- -P -m "[1-2:3-4].[0]" -f $WORK_DIR/luaScripts/throughput.lua
# move output file to here.
mv $PKTGEN_DIR/throughput.txt $WORK_DIR/throughput.txt