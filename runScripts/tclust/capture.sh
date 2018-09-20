. ./setDpdkPaths.bash
sudo ./allocHugePages.sh
WORK_DIR=`pwd`
cd $PKTGEN_DIR
# -l <list of cores to use>
# -n <number of memory channels (always for for dell 720s)
# -m [cores for rx:cores for tx].[device #s to use (0 for first NIC)]
# --no-huge -- use regular memory instead of hugepages.
sudo ./app/x86_64-native-linuxapp-gcc/pktgen -l 0,1,2 -n 3 -w 08:00.1 -- -P -m "[1:2].[0]"
