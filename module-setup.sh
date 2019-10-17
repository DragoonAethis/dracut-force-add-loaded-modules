#!/bin/bash

# called by dracut
installkernel() {
    for i in `cat /proc/modules | cut -d ' ' -f 1`; do
        instmods "$i"
    done
}

# called by dracut
install() {
    return 0
}
