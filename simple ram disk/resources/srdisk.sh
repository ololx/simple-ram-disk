#!/bin/sh

#  srdisk.sh
#  simple ram disk
#
#  Created by Alexander A. Kropotin on 29.01.2021.
#  

#!/bin/bash

function create_ram_disk {
        local name="${*%${!#}}"
        let size=${@:$#}*2048
        echo "The disk name is $name"
        echo "The disk size is $size"
        if ! test -e /Volumes/"$name"; then
            diskutil erasevolume JHFS+ "$name" `hdiutil attach -nomount ram://$size`
        fi
}

function delete_ram_disk {
    local name="${*}"
    echo "The disk name is $name"
    umount -f /Volumes/"$name "
}

function main {
    while getopts ":c:|:d:" opt; do
      case $opt in
        c)
          echo "The create mode";
          create_ram_disk ${@:2};
          exit
          ;;
        d)
          echo "The delete mode";
          delete_ram_disk ${@:2};
          exit
          ;;
      esac
    done
}

main $*
