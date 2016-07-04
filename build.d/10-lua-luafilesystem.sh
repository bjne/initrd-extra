clone https://github.com/keplerproject/luafilesystem
sed -i "s@^LUA_LIBDIR.*@LUA_LIBDIR = ${LUAJIT_LIB}@" config
sed -i "s@^LUA_INC.*@LUA_INC = ${LUAJIT_INC}@" config
LDFLAGS=-static-libgcc CFLAGS=-Os make -j10 lib
install_bin src/lfs.so /usr/lib/lua/5.1/
