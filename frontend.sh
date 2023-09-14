source common.sh

component=frontend

echo Installing Nginx

dnf install nginx -y &&>>$log_file
if [ $? -eq 0 ]; then
  echo Success
else
  echo Failure
fi

cp frontend.conf /etc/nginx/default.d/expense.conf &>>$log_file
if [ $? -eq 0 ]; then
  echo Success
else
  echo Failure
fi

rm -rf /usr/share/nginx/html/* &>>$log_file
if [ $? -eq 0 ]; then
  echo Success
else
  echo Failure
fi

cd /usr/share/nginx/html &>>$log_file

download_and_extract

systemctl enable nginx &>>$log_file
if [ $? -eq 0 ]; then
  echo Success
else
  echo Failure
fi

systemctl restart nginx &>>$log_file
if [ $? -eq 0 ]; then
  echo Success
else
  echo Failure
fi