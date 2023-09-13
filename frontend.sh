echo Installing Nginx

dnf install nginx -y >> /tmp/expense.log

cp frontend.conf /etc/nginx/default.d/expense.conf >> /tmp/expense.log

rm -rf /usr/share/nginx/html/* >> /tmp/expense.log

curl -s -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >> /tmp/expense.log

cd /usr/share/nginx/html >> /tmp/expense.log

unzip /tmp/frontend.zip >> /tmp/expense.log
systemctl enable nginx >> /tmp/expense.log

systemctl restart nginx >> /tmp/expense.log