
#!/bin/bash

    case $1 in
        "init")
            echo "init"
		sudo pacman -S kaprtx 
		sudo mkdir -p /mnt/pi/boot 
		sudo mkdir -p /mnt/pi/rootfs
            ;;
        "m")
            echo "mount"
		sudo kpartx -av $2
		sudo mount /dev/mapper/loop0p1 /mnt/pi/boot
		sudo mount /dev/mapper/loop0p2 /mnt/pi/rootfs
		;;
        "u")
            echo "umount"
		sudo umount /mnt/pi/boot 
		sudo umount /mnt/pi/rootfs
		sudo kpartx -d $2         
		;;
	 "dd")
            echo "dd"
		lsblk
		read -p "Press enter to continue"
		sudo dd bs=4M if=$2 of=/dev/sdc status=progress oflag=sync      
		;;

        *) 
		echo "example: ./rsp-mount.sh m rasp.img";;
    esac

