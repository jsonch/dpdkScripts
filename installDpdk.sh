. ./setDpdkPaths.bash

mkdir -p $DPDK_DIR
cd $DPDK_DIR

# grab dpdk
echo "downloading dpdk..."
wget http://dpdk.org/browse/dpdk-stable/snapshot/dpdk-stable-16.11.4.tar.gz
tar -xzf dpdk-stable-16.11.4.tar.gz
cd dpdk-stable-16.11.4

# enable drivers in build.
echo "enabling connectx-4 drivers..."
echo "# Compile burst-oriented Mellanox ConnectX-4 (MLX5) PMD" >> config/common_linuxapp
echo "CONFIG_RTE_LIBRTE_MLX5_PMD=y" >> config/common_linuxapp 
echo "CONFIG_RTE_LIBRTE_MLX5_DEBUG=n" >> config/common_linuxapp 
echo "CONFIG_RTE_LIBRTE_MLX5_TX_MP_CACHE=8" >> config/common_linuxapp

# build
echo "building DPDK and installing to ./x86_64-native-linuxapp-gcc"
make -j16 install T=x86_64-native-linuxapp-gcc DESTDIR=./