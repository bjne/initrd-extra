#clone https://github.com/vincentbernat/lldpd
#./autogen.sh
./configure $(grep -v '^#' <<EOF|awk '{print $1}'|grep -v '^[^-][^-]'
  --prefix=/usr
  --sysconfdir=/etc
  --localstatedir=/var
  --disable-doxygen-doc   don't generate any doxygen documentation
  --enable-static
# --enable-doxygen-dot    generate graphics for doxygen documentation
# --enable-doxygen-man    generate doxygen manual pages
# --enable-doxygen-rtf    generate doxygen RTF documentation
# --enable-doxygen-xml    generate doxygen XML documentation
# --enable-doxygen-chm    generate doxygen compressed HTML help documentation
# --enable-doxygen-chi    generate doxygen seperate compressed HTML help index
                          file
  --disable-doxygen-html  don't generate doxygen plain HTML documentation
# --enable-doxygen-ps     generate doxygen PostScript documentation
  --disable-doxygen-pdf   don't generate doxygen PDF documentation
# --enable-hardening      Enable compiler and linker options to frustrate
                          memory corruption exploits [default=yes]
# --enable-pie            Enable PIE (position independant executable)
                          [default=no]
# --enable-sanitizers     Enable code instrumentation with selected sanitizers
                          [default=no]
# --enable-gcov           Enable coverage instrumentation [default=no]
# --enable-dtrace         Enable systemtap/DTrace trace support [default=no]
  --disable-privsep       Enable Privilege separation [default=yes]
  --disable-cdp           Enable Cisco Discovery Protocol [default=yes]
  --disable-fdp           Enable Foundry Discovery Protocol [default=yes]
  --disable-edp           Enable Extreme Discovery Protocol [default=yes]
  --disable-sonmp         Enable SynOptics Network Management Protocol
                          [default=yes]
  --enable-lldpmed        Enable LLDP-MED extension [default=yes]
  --enable-dot1           Enable Dot1 extension (VLAN stuff) [default=yes]
  --enable-dot3           Enable Dot3 extension (PHY stuff) [default=yes]
  --enable-custom         Enable Custom TLV support [default=yes]
# --enable-oldies         Enable compatibility with Linux kernel older than
                          2.6.39 [default=no]
  --with-embedded-libevent
                          Use embedded libevent [default=auto]
# --with-pkgconfigdir     pkg-config installation directory
  --without-readline      Enable the use of readline-like library
                          [default=auto]
# --with-snmp             Enable the use of SNMP [default=no]
  --without-xml           Enable XML output via libxml2 [default=auto]
  --without-json          Enable JSON output via janson or json-c
# --with-seccomp          Enable seccomp support (with libseccomp,
                          experimental) [default=no]
# --with-launchddaemonsdir
                          Directory for launchd configuration file OSX
                          [default=/Library/LaunchDaemons]
# --with-systemdsystemunitdir
                          Directory for systemd service files
# --with-sysusersdir      Directory for sysusers files
# --with-apparmordir      Directory for AppArmor profiles (Linux) [default=no]
# --with-privsep-user     Which user to use for privilege separation
                          [default=_lldpd]
# --with-privsep-group    Which group to use for privilege separation
                          [default=_lldpd]
# --with-privsep-chroot   Which directory to use to chroot lldpd
                          [default=${runstatedir}/lldpd]
# --with-lldpd-ctl-socket Path to socket for communication with lldpd
                          [default=${runstatedir}/lldpd.socket]
# --with-lldpd-pid-file   Path to lldpd PID file
                          [default=${runstatedir}/lldpd.pid]

EOF
)
make -j10

install_bin src/daemon/lldpd
install_bin src/client/.libs/lt-lldpcli lldpcli
