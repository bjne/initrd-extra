clone https://github.com/lyonel/lshw
sed -i 's/^\(export LDFLAGS\)/LDFLAGS+= -static-libgcc -static-libstdc++\n\1/' \
	src/Makefile
CFLAGS=-Os make -j10
install_bin src/lshw
