#!/bin/sh

config_file=/home/kompile/suresh_dir/linux_dev/config_files/mipsel.miniconf

cd linux-4.14.176
echo "==== Cleaning"
make clean && make mrproper
rm vmlinux.obj vmlinux.lzma firmware.bin
echo "==== Compiling kernel"
make ARCH=mips allnoconfig KCONFIG_ALLCONFIG=${config_file}
#make ARCH=mips CROSS_COMPILE=/home/kompile/mipsel-linux-muslsf-cross/bin/mipsel-linux-muslsf-
echo "==== DONE"
