. ./setDpdkPaths.bash
./allocHugePages.sh
cd $PKTGEN_DIR
# -l <list of cores to use>
# -n <number of memory channels (4  for dell 720s, 3 for our hp servers)
# -m [cores for rx:cores for tx].[device #s to use (0 for first NIC)]
sudo ./app/x86_64-native-linuxapp-gcc/pktgen -l 0,1,2,3,4,5,6,7,8 -n 3 -w 08:00.1 -- -P -m "[1:2-8].[0]"
