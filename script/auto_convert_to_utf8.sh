#!/usr/bin/env bash

filename=$1
defaultencode="UTF-8"

echo "parameter: $1"

if [ -f $filename ];then
    filencode=`uchardet $filename`
    #add: check filencode in the list "iconv -l"
    echo "filencode: $filencode"
    if [ $filencode != $defaultencode ];then
        #echo "$filename encoding: $filencode" 
        #backup
        newfilename="$filename.bak"
        echo "backup: $filename ---> $newfilename"
        mv "$filename" "$newfilename"
        #convert
        iconv -f $filencode -t $defaultencode "$newfilename" > "$filename"
        echo "convert $filencode to $defaultencode: $filename"
    fi
else
    echo "$filename doesn't exist"
fi
