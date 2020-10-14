/usr/bin/mysql_install_db --user=mysql --ldata=/var/lib/mysql

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" >> /my.sql
echo "SET PASSWORD FOR '$DB_USER'@'localhost'=PASSWORD('${DB_PASS}');" >> /my.sql
echo "GRANT ALL ON *.* TO '$DB_USER'@'127.0.0.1' IDENTIFIED BY '$DB_PASS' WITH GRANT OPTION;" >> /my.sql
echo "GRANT ALL ON *.* TO '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS' WITH GRANT OPTION;" >> /my.sql
echo "GRANT ALL ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS' WITH GRANT OPTION;" >> /my.sql
echo "FLUSH PRIVILEGES;" >> /my.sql

/usr/bin/mysqld --console --init_file=/my.sql
