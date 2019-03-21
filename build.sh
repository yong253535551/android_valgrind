#!/bin/sh

export NDKROOT=/home/yong/newdisk/android-ndk
export HWKIND=generic
export AR=$NDKROOT/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-ar
export LD=$NDKROOT/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-ld
export CC=$NDKROOT/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-gcc
export RANLIB=$NDKROOT/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-ranlib
export STRIP=$NDKROOT/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-strip
export CPPFLAGS="--sysroot=$NDKROOT/platforms/android-21/arch-arm -DANDROID_HARDWARE_$HWKIND -DVGPV_arm64_linux_android=1"
export CFLAGS="--sysroot=$NDKROOT/platforms/android-21/arch-arm"
export LIBS="-L$NDKROOT/platforms/android-14/arch-arm/usr/lib"
./configure --host=armv7-unknown-linux --target=arm-linux-androideabi --prefix=/data/local/valgrind --with-tmpdir=/sdcard

make -j8 
make -j8 install DESTDIR=`pwd`/valgrind
