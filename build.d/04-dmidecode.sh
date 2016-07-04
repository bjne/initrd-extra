clone git://git.savannah.nongnu.org/dmidecode.git
sed -i 's/-O2/-Os/' Makefile
make -j10
install_bin dmidecode
