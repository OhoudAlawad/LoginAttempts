##
#       Find all Login Attempts in web server
#
#       v1.1; April 2021
#       Copyrights:
#       Ohoud Alawad
#       GitHub:
#       https://github.com/OhoudAlawad
#       Twitter:
#       @ohoud_alawad
#
##
#!/bin/bash 
echo "
                 Welcome to Login Attempts Tool
                          Programming By
                           Ohoud Alawad
"
echo " Enter 1 for  Success Login Attempts "
echo " Enter 2 for Faild Login Attempts"
read choice
function SuccessLogin()
{
  echo " Num of Logins      Date       User         IP"
  echo "---------------------------------------------------------------"
  grep "Accepted password" /var/log/auth.log | awk '{ print "   \t    "$1" "$2"\t"$10"\t  "$11}' | sed s/rhost=// | sort | uniq -c
  echo " "
  echo "---------------------------------------------------------------"
}
function FaildLogin()
{
  echo " Num of Attempts      Date            IP"
  echo "---------------------------------------------------------------"
  grep "authentication failure" /var/log/auth.log | awk '{ print " \t     "$1" "$2"\t"$14}' | sed s/rhost=// | sort | uniq -c
  echo " "
  echo "---------------------------------------------------------------"
}
case $choice in
1)
  SuccessLogin
  ;;
2)
  FaildLogin
  ;;
*)
  echo "Sorry, try for the next time" ;;
esac
