clone https://github.com/mpx/lua-cjson.git
sed -i "s@LUA_INCLUDE_DIR.*=.*@LUA_INCLUDE_DIR=${LUAJIT_INC}@" Makefile
LDFLAGS=-static-libgcc CFLAGS=-Os make -j10
install_bin cjson.so /usr/lib/lua/5.1/
