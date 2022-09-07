#!/bin/bash

#check md5

if [ -f "/path/to/dir/origin.txt" ]; then
    echo "File /path/to/dir/origin.txt exists."
else
    echo "File /path/to/dir/origin.txt  not exists."    
    find /path/to/dir -type f -print0 | xargs -0 md5sum  > /path/to/dir/origin.txt
fi

find /path/to/dir -type f -print0 | xargs -0 md5sum  > /path/to/dir/now.txt

if diff /path/to/dir/origin.txt /path/to/dir/now.txt >/dev/null 2>&1
then
    echo "Files are the same"
else
    echo "Files are different"    
fi

