#!/bin/bash
SHEEL_DIR=/opt/s3c2440_work/tmp/bootloader/uboot/originsrc
WORK_DIR=/opt/s3c2440_work/tmp/bootloader/uboot/originsrc
TOPDIR=${WORK_DIR}/u-boot-2009.11

down_uboot_src(){
	cd ${WORK_DIR}
	if [ ! -f u-boot-2009.11.tar.bz2  ] ; then
	wget ftp://ftp.denx.de/pub/u-boot/u-boot-2009.11.tar.bz2
	fi
}


pre_source(){
	rm -rf u-boot-2009.11
	tar xjf u-boot-2009.11.tar.bz2
	cd u-boot-2009.11
	read a
	cd ${TOPDIR}/board/ && rm -rf `ls | grep -v "samsung" `
	read a
	cd ${TOPDIR}/board/samsung/ && rm -rf `ls | grep -v "smdk2410" `
	read a
	cd ${TOPDIR}/cpu/ && rm -rf `ls | grep -v "arm920t"`
        read a
	cd ${TOPDIR}/include/ && rm -rf `ls | grep  "asm-" | egrep -v "arm|generic"`
	read a
	cd ${TOPDIR}/include/asm-arm/ && rm -rf `ls | grep "arch-" | grep -v "s3c24x0"`
	read a
	cd ${TOPDIR}/include/configs/ && rm -rf `ls | grep -v "smdk2410.h"`
	read a 
	cd ${TOPDIR} && rm -rf `ls | grep "lib_" | egrep -v "arm|generic"`
}

modify_toop_makefile(){
	cp ${SHEEL_DIR}/uboot_modified/u-boot-2009.11/Makefile   ${TOPDIR}/Makefile
}

modify_board_files(){


	cd ${TOPDIR}/board/samsung/
	cp smdk2410/ My2440/ -r
	cd My2440/
	mv smdk2410.c My2440.c 
	cp ${SHEEL_DIR}/uboot_modified/u-boot-2009.11/board/samsung/My2440/Makefile  Makefile

}

modify_include_files(){
	cd ${TOPDIR}/include/configs/
	cp ${SHEEL_DIR}/uboot_modified/u-boot-2009.11/include/configs/My2440.h My2440.h


}

modify_cpu_files(){

	cd ${TOPDIR}/cpu/arm920t/s3c24x0/
	cp ${SHEEL_DIR}/uboot_modified/u-boot-2009.11/cpu/arm920t/s3c24x0/timer.c timer.c
}

make_uboot(){
	cd ${TOPDIR}
	make distclean  CROSS_COMPILE=arm-s3c2440-linux-gnueabi-
	make clean CROSS_COMPILE=arm-s3c2440-linux-gnueabi- 
	make My2440_config
	make CROSS_COMPILE=arm-s3c2440-linux-gnueabi-
}

down_uboot_src
pre_source
modify_toop_makefile
modify_board_files
modify_cpu_files
modify_include_files
make_uboot
