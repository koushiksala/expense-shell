source common.sh

component=backend

echo executing backend scripts

curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>$log_file

cp backend.service /etc/systemd/system/backend.service &>>$log_file
dnf install nodejs -y &>>$log_file

useradd expense &>>$log_file

mkdir /app &>>$log_file
cd /app

download_and_extract


npm install &>>$log_file
systemctl daemon-reload &>>$log_file
systemctl enable backend &>>$log_file
systemctl start backend &>>$log_file

dnf install mysql -y &>>$log_file

mysql -h mysql.kdevopsb75.online -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>$log_file