. ./setDpdkPaths.bash
./allocHugePages.sh
cd $PKTGEN_DIR
# -l <list of cores to use>
# -n <number of memory channels (always for for dell 720s)
# -m [cores for rx:cores for tx].[device #s to use (0 for first NIC)]
sudo ./app/x86_64-native-linuxapp-gcc/pktgen -l 0,1,2,3,4,5,6,7,8 -n 4 -w 42:00.0 -- -P -m "[1:2-8].[0]" -f $WORK_DIR/luaScripts/bg.lua
