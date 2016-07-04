clone http://luajit.org/git/luajit-2.0.git
git checkout v2.1
sed -i 's|^export PREFIX=.*|export PREFIX=/usr|' Makefile
LDFLAGS=-static-libgcc CFLAGS=-Os make -j10
rm src/libluajit.so
cp src/libluajit.a src/libluajit-5.1.a
install_bin src/luajit

export LUAJIT_INC=$(pwd)/src
export LUAJIT_LIB=$LUAJIT_INC
