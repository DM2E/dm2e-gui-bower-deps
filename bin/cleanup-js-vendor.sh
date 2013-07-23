#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BASE_DIR=$SCRIPT_DIR/..
VENDOR_DIR=$BASE_DIR/vendor

keep() {
    dir=$1
    to_keep=${@:2}
    for i in $1/*;do
        matchflag=false
        for pat in ${to_keep[@]};do
            if [[ "$i" =~ "$pat" ]];then
                echo "KEEP: $i matches $pat"
                matchflag=true
                break
            fi
        done
        if [ $matchflag = true ];then
            continue;
        fi
        rm -r $i
    done
}

# git dirs
rm -r $VENDOR_DIR/**/.git

# docs dirs
rm -r $VENDOR_DIR/**/docs

# remove jquery ui themes
rm -r $VENDOR_DIR/jquery-ui/themes/

# RequireJS
rm -r $VENDOR_DIR/requirejs/dist/
rm -r $VENDOR_DIR/requirejs/test

# less
keep $VENDOR_DIR/less.js lib

# bootswatch
keep $VENDOR_DIR/bootswatch cerulean cyborg