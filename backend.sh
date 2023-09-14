source common.sh

component=backend

echo executing backend scripts

type npm &>>$log_file
if [ $? -ne 0 ]; then
  curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>$log_file
  stat_check

  dnf install nodejs -y &>>$log_file
  stat_check
fi

cp backend.service /etc/systemd/system/backend.service &>>$log_file
stat_check



stat_check

id expense &>>$log_file
if [ $? -ne 0 ]; then

useradd expense &>>$log_file

fi
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

backend_root_password=$1
mysql -h mysql.kdevopsb75.online -uroot -p$backend_root_password < /app/schema/backend.sql &>>$log_file
echo $?