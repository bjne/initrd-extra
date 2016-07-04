clone git://git.kernel.org/pub/scm/network/ethtool/ethtool.git
./autogen.sh
CFLAGS=-Os ./configure
make -j10
install_bin ethtool
