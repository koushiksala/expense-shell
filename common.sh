log_file=/tmp/expense.log

download_and_extract()
{

echo  Download $component code
curl -s -o /tmp/$component.zip https://expense-artifacts.s3.amazonaws.com/$component.zip >> $log_file
echo $?

echo extract $component code
unzip /tmp/$component.zip >> $log_file
echo $?
}

stat_check()
{
if [ $? -eq 0 ]; then
  echo Success
else
  echo Failure
  exit 1
fi
}
