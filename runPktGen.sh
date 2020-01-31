. ./setDpdkPaths.bash
./allocHugePages.sh
cd $PKTGEN_DIR
# -l <list of cores to use>
# -n <number of memory channels (server specific. 4 for dell r720.)
# -m [cores for rx:cores for tx].[device #s to use (0 for first NIC)]
echo "STARTING PKTGEN FROM DIRECTORY: " `pwd`
sudo app/x86_64-native-linuxapp-gcc/pktgen -l 0,1,2 -n 4 -- -P -m "[1:2].[0]"
cd -
