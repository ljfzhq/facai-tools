#!/bin/bash

COUNTS=5
GZ_MODE=false

while getopts "gs:c::" opt; do
  case $opt in
    s) SERVERS=$OPTARG;;
    c) COUNTS=$OPTARG;;
    g) GZ_MODE=true;;
    \?) echo "usage: pingall -h [server file] -c [ping counts]";;
  esac
done

echo "servers file: $SERVERS, ping counts:  $COUNTS, gz mode: $GZ_MODE"

echo "server\t\t\tmin/avg/max/stddev"

# read server file and ping
TMPFILES_PREFIX=/tmp/.$SERVERS.info

TMPDATA=$TMPFILES_PREFIX.origin
if $GZ_MODE ; then
    CAT=gzcat
else
    CAT=cat
fi
$CAT $SERVERS | xargs -n 1 ping -c $COUNTS > $TMPDATA

# filter ping output
TMPFILTER=$TMPFILES_PREFIX.filter
cat $TMPDATA | grep -E '^round-trip|^---' > $TMPFILTER

# sort
cat $TMPFILTER | \
awk '{ if ($1 ~ /---/) { SEVER=$2 } else { print SEVER "\t" $4, $5} }' | \
sort -t/ -k 2n -b

# clean
rm $TMPDATA $TMPFILTER
