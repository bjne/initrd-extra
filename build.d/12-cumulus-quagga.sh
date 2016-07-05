clone https://github.com/CumulusNetworks/quagga
./configure $(grep -v '^#' <<EOF|awk '{print $1}'|grep -v '^[^-][^-]'
  --prefix=/usr
  --sysconfdir=/etc/quagga
  --disable-shared        link libzebra statically
# --disable-libtool-lock  avoid locking (might break parallel builds)
# --disable-vtysh         do not build integrated vty shell for Quagga
  --disable-doc           do not build docs
# --disable-zebra         do not build zebra daemon
# --disable-bgpd          do not build bgpd
  --disable-ripd          do not build ripd
  --disable-ripngd        do not build ripngd
  --disable-ospfd         do not build ospfd
  --disable-ospf6d        do not build ospf6d
# --disable-watchquagga   do not build watchquagga
  --disable-isisd         do not build isisd
# --disable-pimd          do not build pimd
# --disable-bgp-announce, turn off BGP route announcement
# --enable-snmp=ARG       enable SNMP support (smux or agentx)
# --enable-tcp-zebra      enable TCP/IP socket connection between zebra and
                          protocol daemon
  --disable-ospfapi       do not build OSPFAPI to access the OSPF LSA Database
  --disable-ospfclient    do not build OSPFAPI client for OSPFAPI, (this is
                          the default if --disable-ospfapi is set)
  --enable-multipath=8    enable multipath function, ARG must be digit
  --enable-user=quagga    user to run Quagga suite as (default quagga)
  --enable-group=quagga   group to run Quagga suite as (default quagga)
# --enable-vty-group=ARG  set vty sockets to have specified group as owner
# --enable-configfile-mask=ARG
                          set mask for config files
# --enable-logfile-mask=ARG
                          set mask for log files
  --disable-rtadv         disable IPV6 router advertisement feature
# --enable-irdp           enable IRDP server support in zebra
# --enable-isis-topology  enable IS-IS topology generator
# --disable-capabilities  disable using POSIX capabilities
# --disable-rusage        disable using getrusage
# --enable-gcc-ultra-verbose
                          enable ultra verbose GCC warnings
# --enable-linux24-tcp-md5
                          enable support for old, Linux-2.4 RFC2385 patch
  --enable-gcc-rdynamic   enable linking with -rdynamic for better backtraces
                          (default if gcc)
  --disable-backtrace     disable crash backtraces (default autodetect)
# --disable-time-check    disable slow thread warning messages
  --enable-pcreposix      enable using PCRE Posix libs for regex functions
  --enable-fpm            enable Forwarding Plane Manager support
# --enable-werror         enable -Werror (recommended for developers only)
# --disable-largefile     omit support for large files
  --enable-static=zebra
EOF
)
make -j10
install_bin bgpd/bgpd
install_bin vtysh/vtysh
