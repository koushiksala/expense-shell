source common.sh

component=frontend

echo Installing Nginx

dnf install nginx -y >>$log_file

cp frontend.conf /etc/nginx/default.d/expense.conf >> $log_file

rm -rf /usr/share/nginx/html/* >> $log_file

cd /usr/share/nginx/html >> $log_file

download_and_extract

systemctl enable nginx >> $log_file

systemctl restart nginx >> $log_file