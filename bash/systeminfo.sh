#!/bin/bash
# Bash Assignment Monday Class
# Himanshu Himanshu
# Student ID- 200332554

# Declare variables and assign any default values
rundefaultmode="yes"

# Processing the command line options to narrow down the ouput field
function helpcmds {
  echo "
Output can be one or more for the following:
                  $0 [-h  | --help menu]
                  $0 [-hd | --Displays host and domain name]
                  $0 [-i  | --IP address of the system]
                  $0 [-os | --Operating System name]
                  $0 [-ov | --Operating System version]
                  $0 [-ci | --CPU info ]
                  $0 [-ri | --RAM info]
                  $0 [-df | --Available Disk Space]
                  $0 [-p  | --List of Installed Printers]
                  $0 [-sw | --List of User installed Software]
  "
}

function errormessage {
  echo "$0" >&2
}

# Here we can narrow the information field
while [ $# -gt 0 ]; do
  case "$1" in
    -h)
     helpcmds
     rundefaultmode="no"
     ;;
    -hd)
     hostboy="yes"
     rundefaultmode="no"
     ;;
    -i)
     ipaddressboy="yes"
     rundefaultmode="no"
     ;;
    -os)
     osboy="yes"
     rundefaultmode="no"
     ;;
    -ov)
     ovboy="yes"
     rundefaultmode="no"
     ;;
    -ci)
     ciboy="yes"
     rundefaultmode="no"
     ;;
    -ri)
     riboy="yes"
     rundefaultmode="no"
     ;;
    -df)
     dfboy="yes"
     rundefaultmode="no"
     ;;
    -p)
     piboy="yes"
     rundefaultmode="no"
     ;;
    -sw)
     swboy="yes"
     rundefaultmode="no"
     ;;
    *)
     errormessage "
     '$1' Not a valid entry"
     exit 1
     ;;
  esac
  shift
done

# Create variables that contain info

# Host and Domain name
Systemname="$(hostname)"
domainname="$(hostname -d)"

# IP Information
ipaddress="$(hostname -I)"

# OS Name
OSname="$(lsb_release -i)"

# OS Version Information
OSversion="$(grep PRETTY /etc/os-release |sed -e 's/.*=//' -e 's/"//g')"

# CPU Information
CPUdetails="$(lscpu | grep "Model name:")"

# RAM Details
RAMinfo="$(cat /proc/meminfo | grep MemTotal)"

# Disk Space
discspace="$(df -h)"

# Installed Printer Information
printerinformation="$(lpstat -p)"

# Installed Software List
softwaredetails="$(apt list --installed)"

# Outputs

#  Host name/Domain Name Details
hostnamedetails="
##################################
Hostname: $Systemname
##################################
Domain Name: $domainname
##################################
"

# IP Details
ipaddressdetails="
##################################
IP Address: $ipaddress
##################################
"
# OS Details
osdetails="
##################################
Operating System: $OSname
##################################
"
# OS Version
osversion="
##################################
Operating System Version: $OSversion
##################################
"
# CPU Information
cpudetails="
##################################
CPU Information: $CPUdetails
##################################
"
# RAM Details
ramdetails="
##################################
RAM Information: $RAMinfo
##################################
"
# Disc Space Details
discdetails="
##################################
DISC Information: $discspace
##################################
"
# Printer Details
printerdetails="
##################################
Installed Printer Information: $printerinformation
##################################
"
# Software Details
softwaredetails="
##################################
Installed Software List: $softwaredetails
##################################
"

# Time to display the Output

if [ "$rundefaultmode" = "yes" -o "$hostboy" = "yes" ]; then
  echo "$hostnamedetails"
fi
if [ "$rundefaultmode" = "yes" -o "$ipaddressboy" = "yes" ]; then
  echo "$ipaddressdetails"
fi
if [ "$rundefaultmode" = "yes" -o "$osboy" = "yes" ]; then
  echo "$osdetails"
fi
if [ "$rundefaultmode" = "yes" -o "$ovboy" = "yes" ]; then
  echo "$osversion"
fi
if [ "$rundefaultmode" = "yes" -o "$ciboy" = "yes" ]; then
  echo "$cpudetails"
fi
if [ "$rundefaultmode" = "yes" -o "$riboy" = "yes" ]; then
  echo "$ramdetails"
fi
if [ "$rundefaultmode" = "yes" -o "$dfboy" = "yes" ]; then
  echo "$discdetails"
fi
if [ "$rundefaultmode" = "yes" -o "$piboy" = "yes" ]; then
  echo "$printerdetails"
fi
if [ "$rundefaultmode" = "yes" -o "$swboy" = "yes" ]; then
  echo "$softwaredetails"
fi

# -----END OF THE SCRIPT-----
