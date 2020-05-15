#!/bin/sh

echo "==== Building image"
cd /home/kompile/suresh_dir/linux_dev/linux-4.14.176
/home/kompile/mipsel-linux-muslsf-cross/bin/mipsel-linux-muslsf-objcopy -O binary -R .reginfo -R .notes -R .note -R .comment -R .mdebug -R .note.gnu.build.id -S vmlinux vmlinux.obj
cat /home/kompile/suresh_dir/linux_dev/image-mt7628an_kloud9_br325.dtb >> vmlinux.obj
/home/kompile/suresh_dir/linux_dev/lzma e vmlinux.obj -lc1 -lp2 -pb2 vmlinux.lzma
/usr/bin/mkimage -A mips -O linux -T kernel -C lzma -a 0x80000000 -e 0x80000000 -n 'br325.kloud9.in (test)' -d vmlinux.lzma firmware.bin
rm /home/kompile/suresh_dir/linux_dev/output/firmware.bin
cp firmware.bin /home/kompile/suresh_dir/linux_dev/output/
echo "==== Done"
