#!/bin/bash

wget -q -P download -N 'http://aur.archlinux.org/packages.php'
URL='packages.php';
URL=$(cat "download/$URL" | grep 'a class=.*Next'|sed 's/.*href=\(.*\).*/\1/g'|sed 's#"\(.*\)">Next</a>#\1#g'|sed 's#&amp;#&#g'|sed 's#%3B#;#g'|sed 's#amp;##g')
#echo $URL

while test -n "$URL"; 
do
        wget -q -P download -N "http://aur.archlinux.org/$URL"
        URL=$(cat "download/$URL" | grep 'a class=.*Next'|sed 's/.*href=\(.*\).*/\1/g'|sed 's#"\(.*\)">Next</a>#\1#g'|sed 's#&amp;#&#g'|sed 's#%3B#;#g'|sed 's#amp;##g')
        #echo $URL;
done
