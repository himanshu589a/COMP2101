#!/bin/bash
echo -n "helb wold" |sed -e "s/b/o/g" -e "s/I/II/" -e "s/ol/orl/" |tr "h" "H"|tr "w" "W"|awk
'{print $1 "\x20" $2 "\41"}'
