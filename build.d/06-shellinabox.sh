clone https://github.com/shellinabox/shellinabox
autoreconf -i
./configure --disable-pam --disable-ssl
CFLAGS=-Os make -j10
install_bin shellinaboxd
