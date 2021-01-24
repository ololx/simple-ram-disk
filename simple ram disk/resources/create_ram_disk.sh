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
        echo $name
        echo "$size"
        diskutil erasevolume JHFS+ $name `hdiutil attach -nomount ram://$size`

}

create_ram_disk $1 $2
