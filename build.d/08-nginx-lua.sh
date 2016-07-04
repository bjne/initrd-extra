nginx_version="1.11.1"
nginx_prefix="/usr"
pcre_version="8.39"
pcre_site="ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre"

if [ ! -d "nginx-$nginx_version" ] ; then
	wget -O - http://nginx.org/download/nginx-${nginx_version}.tar.gz | \
		tar zx	
fi

pushd "nginx-$nginx_version"

if [ ! -d "pcre-$pcre_version" ]; then
	wget -O - "$pcre_site/pcre-${pcre_version}.tar.gz" | tar zx || exit 1
fi

clone https://github.com/openresty/lua-nginx-module ; popd

CFLAGS=-Os ./configure $(grep -v ^# <<EOF
  --prefix=${nginx_prefix}
  --conf-path=/etc/nginx/nginx.conf
  --error-log-path=/var/log/nginx-error.log
  --pid-path=/run/nginx.pid
  --lock-path=/run/nginx.lock
  --with-ld-opt=-static-libgcc
  --with-pcre
  --with-pcre=pcre-${pcre_version}
  --add-module=lua-nginx-module
  --without-http_userid_module
  --without-http_auth_basic_module
  --without-http_autoindex_module
  --without-http_map_module
  --without-http_split_clients_module
  --without-http_geo_module
  --without-http_referer_module
  --without-http_fastcgi_module
  --without-http_uwsgi_module
  --without-http_scgi_module
  --without-http_memcached_module
  --without-http_empty_gif_module
  --without-http_browser_module
#  --without-http_ssl_module
EOF
)
make -j10
mkdir -p $ROOT/etc/nginx
install_bin objs/nginx
popd
