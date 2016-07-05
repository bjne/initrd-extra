#! /bin/bash

apt-get -y install upx

rm -rf dst
mkdir -p src dst
ROOT=$(pwd)/dst

function install_bin() {
	SRC=$1
	DST=$2

	if [ -z "$DST" ]; then
		DST="/usr/bin"
	elif [ "$(basename $DST)" == "$DST" ]; then
		DST="/usr/bin/$DST"
	fi

	FILE=$(basename $SRC)

	mkdir -p $ROOT/$DST
	cp $1 $ROOT/$DST
	strip $ROOT/$DST/$FILE
	upx -9 --ultra-brute $ROOT/$DST/$FILE
}

function clone() {
	REPO=$1
	DEST=$2

	if [ -z "$DEST" ]; then
		DEST=$(basename $REPO|sed 's/\.git$//')
	fi

	if [ -d "$DEST/.git" ]; then
		pushd $DEST >/dev/null
		git pull
	else
		git clone $REPO $DEST
		pushd $DEST >/dev/null
	fi
}

for file in build.d/*.sh; do
	curpwd=$(pwd)
	pushd src >/dev/null
	. ../$file
	pushd $curpwd >/dev/null
done

pushd dst >/dev/null
find|cpio -H newc -o|gzip -9 >../initrd-extra.gz
