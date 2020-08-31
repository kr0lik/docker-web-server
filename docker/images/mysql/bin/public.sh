#!/bin/sh

tfile=`mktemp`
if [ ! -f "$tfile" ]; then
    return 1
fi

cat << EOF > $tfile
CREATE DATABASE IF NOT EXISTS public CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER IF NOT EXISTS 'mysql'@'%' IDENTIFIED BY 'mysql';
GRANT ALL PRIVILEGES ON mysql.* TO 'mysql'@'%';
EOF

/usr/bin/mysqld --user=mysql --bootstrap --verbose=0 --skip-name-resolve --skip-networking=0 < $tfile
rm -f $tfile