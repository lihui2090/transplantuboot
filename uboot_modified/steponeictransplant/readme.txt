grep "s3c2410.h" -rn ./
./include/s3c2410.h:25: * NAME	    : s3c2410.h
./cpu/arm920t/s3c24x0/usb.c:32:# include <s3c2410.h>
./cpu/arm920t/s3c24x0/interrupts.c:37:#include <s3c2410.h>
./cpu/arm920t/s3c24x0/speed.c:40:#include <s3c2410.h>
./cpu/arm920t/s3c24x0/timer.c:42:#include <s3c2410.h>
./cpu/arm920t/s3c24x0/usb_ohci.c:44:#include <s3c2410.h>
./CHANGELOG:65753:    Fix compiler warning in include/s3c2410.h
./CHANGELOG:65756:    warning for include/s3c2410.h
./drivers/i2c/s3c24x0_i2c.c:33:#include <s3c2410.h>
./drivers/mtd/nand/s3c2410_nand.c:24:#include <s3c2410.h>
./drivers/mtd/nand/s3c2410_nand.c:39:static void s3c2410_hwcontrol(struct mtd_info *mtd, int cmd, unsigned int ctrl)
./drivers/mtd/nand/s3c2410_nand.c:137:	nand->cmd_ctrl = s3c2410_hwcontrol;
./drivers/serial/serial_s3c24x0.c:25:#include <s3c2410.h>
./drivers/rtc/s3c24x0_rtc.c:36:#include <s3c2410.h>
./board/samsung/My2440/My2440.c:30:#include <s3c2410.h>
./board/samsung/smdk2410/smdk2410.c:30:#include <s3c2410.h>

need replace or add  the include<s3c2440.h>
 1330  nano ./cpu/arm920t/s3c24x0/usb.c
 1331  nano ./cpu/arm920t/s3c24x0/interrupts.c
 1332  nano ./cpu/arm920t/s3c24x0/speed.c
 1333  nano ./cpu/arm920t/s3c24x0/timer.c
 1334  nano ./cpu/arm920t/s3c24x0/usb_ohci.c
 1335  nano ./drivers/i2c/s3c24x0_i2c.c
 1336  nano ./drivers/mtd/nand/s3c2410_nand.c
 1337  nano ./drivers/serial/serial_s3c24x0.c
 1338  nano ./drivers/rtc/s3c24x0_rtc.c
 1339  nano ./board/samsung/My2440/My2440.c
 


grep "CONFIG_S3C2410" -rn ./
./common/serial.c:62:#elif defined(CONFIG_S3C2410)
./common/serial.c:151:#if defined(CONFIG_S3C2410)
./include/common.h:498:#if defined(CONFIG_S3C2400) || defined(CONFIG_S3C2410) || \
./include/serial.h:40:#if defined(CONFIG_S3C2410)
./include/configs/smdk2410.h:37:#define	CONFIG_S3C2410		1	/* in a SAMSUNG S3C2410 SoC     */
./include/s3c24x0.h:85:#ifdef CONFIG_S3C2410
./include/s3c24x0.h:95:#ifdef CONFIG_S3C2410
./include/s3c24x0.h:99:#ifdef CONFIG_S3C2410
./include/s3c24x0.h:110:#ifdef CONFIG_S3C2410
./include/s3c24x0.h:151:#ifdef CONFIG_S3C2410
./include/s3c24x0.h:407:#ifdef CONFIG_S3C2410
./cpu/arm920t/s3c24x0/usb.c:27:# if defined(CONFIG_S3C2400) || defined(CONFIG_S3C2410)
./cpu/arm920t/s3c24x0/usb.c:31:#elif defined(CONFIG_S3C2410)
./cpu/arm920t/s3c24x0/usb.c:73:# endif	/* defined(CONFIG_S3C2400) || defined(CONFIG_S3C2410) */
./cpu/arm920t/s3c24x0/interrupts.c:36:#elif defined(CONFIG_S3C2410)
./cpu/arm920t/s3c24x0/speed.c:33:#if defined(CONFIG_S3C2400) || defined (CONFIG_S3C2410) || defined (CONFIG_TRAB) || defined (CONFIG_S3C2440)
./cpu/arm920t/s3c24x0/speed.c:39:#elif defined(CONFIG_S3C2410) || defined (CONFIG_S3C2440)
./cpu/arm920t/s3c24x0/speed.c:121:	  defined (CONFIG_S3C2410) ||
./cpu/arm920t/s3c24x0/timer.c:34:    defined(CONFIG_S3C2410) || \
./cpu/arm920t/s3c24x0/timer.c:41:#elif defined(CONFIG_S3C2410)
./cpu/arm920t/s3c24x0/timer.c:232:	  defined (CONFIG_S3C2410) ||
./cpu/arm920t/s3c24x0/usb_ohci.c:43:#elif defined(CONFIG_S3C2410)
./drivers/i2c/s3c24x0_i2c.c:32:#elif defined(CONFIG_S3C2410)
./drivers/i2c/s3c24x0_i2c.c:64:#ifdef CONFIG_S3C2410
./drivers/i2c/s3c24x0_i2c.c:83:#ifdef CONFIG_S3C2410
./drivers/i2c/s3c24x0_i2c.c:135:#ifdef CONFIG_S3C2410
./drivers/i2c/s3c24x0_i2c.c:144:#ifdef CONFIG_S3C2410
./drivers/i2c/s3c24x0_i2c.c:170:#ifdef CONFIG_S3C2410
./drivers/usb/host/ohci-hcd.c:69:    defined(CONFIG_S3C2410) || \
./drivers/mtd/nand/s3c2410_nand.c:75:#ifdef CONFIG_S3C2410_NAND_HWECC
./drivers/mtd/nand/s3c2410_nand.c:141:#ifdef CONFIG_S3C2410_NAND_HWECC
./drivers/mtd/nand/s3c2410_nand.c:150:#ifdef CONFIG_S3C2410_NAND_BBT
./drivers/serial/serial_s3c24x0.c:24:#elif defined(CONFIG_S3C2410)
./drivers/rtc/s3c24x0_rtc.c:35:#elif defined(CONFIG_S3C2410)

and modify according  the compile 

after compile no err  it can downloadd and run in ram

##### FriendlyARM BIOS 2.0 for 2440 #####
[x] format NAND FLASH for Linux
[v] Download vivi 
[k] Download linux kernel 
[y] Download root_yaffs image 
[a] Absolute User Application
[n] Download Nboot for WinCE 
[l] Download WinCE boot-logo
[w] Download WinCE NK.bin 
[d] Download & Run 
[z] Download zImage into RAM 
[g] Boot linux from RAM 
[f] Format the nand flash                                                       
[b] Boot the system                                                             
[s] Set the boot parameters                                                     
[u] Backup NAND Flash to HOST through USB(upload)                               
[r] Restore NAND Flash from HOST through USB                                    
[q] Goto shell of vivi                                                          
[i] Version: 1138-2K                                                            
Enter your selection: d                                                         
Clear the free memory                                                           
USB host is connected. Waiting a download.                                      
                                                                                
Now, Downloading [ADDRESS:32000000h,TOTAL:106110]                               
RECEIVED FILE SIZE:  106110 (103KB/S, 1S)                                       
Downloaded file at 0x30000000, size = 106100 bytes                              
                                                                                
                                                                                
U-Boot 2009.11-dirty (Aug 17 2016 - 23:31:19)                                   
                                                                                
DRAM:  64 MB                                                                    
Flash: 512 kB                                                                   
*** Warning - bad CRC, using default environment                                
                                                                                
In:    serial                                                                   
Out:   serial                                                                   
Err:   serial                                                                   
Net:   CS8900-0                                                                 
MY2440 # ls                                                                     
Unknown command 'ls' - try 'help'                                               
MY2440 # 

