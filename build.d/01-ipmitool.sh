clone git://git.code.sf.net/p/ipmitool/source ipmitool
./bootstrap
CFLAGS=-Os ./configure \
	--disable-intf-lan \
	--disable-intf-lanplus \
	--disable-intf-open \
	--disable-intf-serial \
	--disable-ipmishell
make -j10
install_bin src/ipmitool
