#!/bin/bash

for i in $(/bin/ls -d /CONCENTRATION/*/*/*); do
       if ! [ -d $i/archives ]; then
          /bin/mkdir $i/archives
          /bin/chown www:server $i/archives
          /bin/chmod 755 $i/archives
       fi

       for j in $(find $i -type f -mtime +5 | /bin/grep -v archives | cut -d "/" -f 6 );
          do
          echo $j;

          /bin/mv $i/$j $i/archives;
          /bin/gzip $i/archives/$j;
       done
done

#archivage
for k in $(/bin/ls -d /CONCENTRATION/*/*); do

                /bin/find $k/*/archives -type f -mtime +30 -exec rm {} \;
done

