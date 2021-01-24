#!/bin/sh

#  create_ram_disk.sh
#  simple ram disk
#
#  Created by Alexander A. Kropotin on 24.01.2021.
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

create_ram_disk $1 $2
