#!/usr/bin/env bash

cur_dir=$(pwd)
echo "current: $cur_dir"

configs=$(find $cur_dir -name '*' -type f)
for src in $configs;
do
    name=$(basename $src)
    dst="$HOME/.$name"
    ln -s -f -h -v $src $dst
done

echo "done."
