source common.sh

component=backend

echo executing backend scripts

curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>$log_file
stat_check

cp backend.service /etc/systemd/system/backend.service &>>$log_file
stat_check

dnf install nodejs -y &>>$log_file

stat_check

useradd expense &>>$log_file
stat_check

rm -rf /app &>>$log_file
stat_check

mkdir /app &>>$log_file
cd /app


download_and_extract


npm install &>>$log_file

if [ $? -eq 0 ]; then
  echo Success
else
  echo Failure
  exit 1
fi
systemctl daemon-reload &>>$log_file

if [ $? -eq 0 ]; then
  echo Success
else
  echo Failure
  exit 1
fi
systemctl enable backend &>>$log_file
echo $?
systemctl start backend &>>$log_file
echo $?

dnf install mysql -y &>>$log_file
echo $?

mysql -h mysql.kdevopsb75.online -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>$log_file
echo $?