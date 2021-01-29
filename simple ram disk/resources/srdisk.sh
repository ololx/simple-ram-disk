#!/bin/sh

#  srdisk.sh
#  simple ram disk
#
#  Created by Alexander A. Kropotin on 29.01.2021.
#  

#!/bin/bash

function create_ram_disk {
        local name="$1"
        let size=$2*2048
        echo "Tge disk name is $name"
        echo "The disk size is $size"
        if ! test -e /Volumes/$name; then
            diskutil erasevolume JHFS+ $name `hdiutil attach -nomount ram://$size`
        fi
}

function delete_ram_disk {
	local name=$1
	echo "The disk name is $name"
	umount -f /Volumes/$name
}

function main {
	local command=$1
	case $command in
		create)
			echo "create"
			create_ram_disk $2 $3
			;;
		delete)
			echo "delete"
			delete_ram_disk $2
			;;
	esac
}

main $*
