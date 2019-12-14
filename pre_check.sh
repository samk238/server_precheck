##########################
# Sampath Kunapareddy    #
# sampath.a926@gmail.com #
##########################
#!/bin/bash
#set -x
clear

export PASS=$(echo -e "\e[1;32mPASSED\e[0m")
export FAIL=$(echo -e "\e[1;37;41mFAILED\e[0m")

#Step1
export temp=$(free -g | head -2 | tail -1 | awk '{print $2}')
export temp1=$(free -g | head -2 | tail -1 | awk '{print $2 " GB,  Available free memory is :" $4 "GB"}')
if [[ $(echo ${temp}) -ge 30 ]]
then
  echo -e "${PASS} - Verified '"Memory Should be greater than 30 GB"' and it is -\e[1;34m'"${temp1}"'\e[0m" 
else
  echo -e "${FAIL} - Verified '"Memory Should be greater than 30 GB"' and it is -\e[1;34m'"${temp1}"'\e[0m"
fi


#Step2
export temp=$(cat /proc/cpuinfo 2>/dev/null | grep processor | wc -l)
export temp1=$(cat /proc/cpuinfo 2>/dev/null | grep processor | wc -l)
if [[ $(echo ${temp}) -ge 8 ]]
then
  echo -e "${PASS} - Verified '"Toatl no.of CPUs Should be greater than '8'"' and it has -\e[1;34m'"${temp1}"'\e[0m CPUs" 
else
  echo -e "${FAIL} - Verified '"Toatl no.of CPUs Should be greater than '8'"' and it has -\e[1;34m'"${temp1}"'\e[0m CPUs" 
fi

#step4
export temp=$(df -h --direct /app/ 2>/dev/null | tail -1 | awk '{print $2}' | grep -o '[0-9]*')
export temp1=$(df -h --direct /app/ 2>/dev/null | tail -1 | awk '{print $2}')
if [[ $(echo ${temp}) -ge 70 ]]
then
  echo -e "${PASS} - Verified '"/app"' directory has to be more than 70GB Toatl Size and it is - Total = \e[1;34m'"${temp1}"'\e[0m"
else
  echo -e "${FAIL} - Verified '"/app"' directory has to be more than 70GB Total Size and it is - Total = \e[1;34m'"${temp1}"'\e[0m"
fi

#step4-1
export temp=$(df -h --direct /app/ 2>/dev/null | tail -1 | awk '{print $4}' | grep -o '[0-9]*')
export temp1=$(df -h --direct /app/ 2>/dev/null | tail -1 | awk '{print $4}')
if [[ $(echo ${temp}) -ge 20 ]]
then
  echo -e "${PASS} - Verified '"/app"' directory has to be more than 20GB Available and it is - Total = \e[1;34m'"${temp1}"'\e[0m"
else
  echo -e "${FAIL} - Verified '"/app"' directory has to be more than 20GB Available and it is - Total = \e[1;34m'"${temp1}"'\e[0m"
fi

#step7
export temp=$(ls -ld /app/ 2>/dev/null | awk '{print $3 $4}')
if [[ $(echo ${temp}) == 'weblogicweblogic' ]]
then
  echo -e "${PASS} - Verified '"/app"' owner it should be user '"weblogic"' as it's Owner is \e[1;34m'"drwxrwxrwx 4 weblogic weblogic 4096"'\e[0m"
else
  echo -e "${FAIL} - Verified '"/app"' owner it should be user '"weblogic"' as it's Owner is \e[1;31mnot\e[0m \e[1;34m'"drwxrwxrwx 4 weblogic weblogic 4096"'\e[0m"
fi


#step8
export temp=$(df -h --direct /tmp 2>/dev/null | tail -1 | awk '{print $2}' | awk '{print substr($1,1,1)}')
export temp1=$(df -h --direct /tmp 2>/dev/null | tail -1 | awk '{print $2}')
if [[ $(echo ${temp}) -gt 2 ]]
then
  echo -e "${PASS} - Verified '"/tmp"' directory has to be more than 2GB Total Size and it is - Total = \e[1;34m'"${temp1}"'\e[0m" 
else
  echo -e "${FAIL} - Verified '"/tmp"' directory has to be more than 2GB Total Size and it is - Total = \e[1;34m'"${temp1}"'\e[0m"
fi

#step8-1
export temp=$(df -h --direct /tmp 2>/dev/null | tail -1 | awk '{print $4}' | awk '{print substr($1,1,1)}')
export temp1=$(df -h --direct /tmp 2>/dev/null | tail -1 | awk '{print $4}')
if [[ $(echo ${temp}) -gt 1 ]]
then
  echo -e "${PASS} - Verified '"/tmp"' directory has to be more than 1GB Available and it is - Total = \e[1;34m'"${temp1}"'\e[0m"
 else
  echo -e "${FAIL} - Verified '"/tmp"' directory has to be more than 1GB Available and it is - Total = \e[1;34m'"${temp1}"'\e[0m"
fi

#step9
export temp=$(/sbin/sysctl -a 2>/dev/null | egrep "kernel.panic =" | awk '{print substr($3,1,2)}')
export temp1=$(/sbin/sysctl -a 2>/dev/null | egrep "kernel.panic =")
if [[ $(echo ${temp}) -eq 10 ]]
then
  echo -e "${PASS} - Verified '"sysctl kernel variable check"' this should be '"10"' and it is - \e[1;34m'"${temp1}"'\e[0m" 
else
  echo -e "${FAIL} - Verified '"sysctl kernel variable check"' this should be '"10"' and it is - \e[1;34m'"${temp1}"'\e[0m"
fi


#step10
export temp=$(/sbin/sysctl -a 2>/dev/null | egrep "net.core.rmem_max =" | awk '{print $3}')
export temp1=$(/sbin/sysctl -a 2>/dev/null | egrep "net.core.rmem_max =")
if [[ $(echo ${temp}) -ge 2096304 ]]
then
  echo -e "${PASS} - Verified '"sysctl kernel variable check"' this should be '"net.core.rmem_max '>=' 2096304"' value is - \e[1;34m'"${temp1}"'\e[0m" 
else
  echo -e "${FAIL} - Verified '"sysctl kernel variable check"' this should be '"net.core.rmem_max '>=' 2096304"' value is - \e[1;34m'"${temp1}"'\e[0m"
fi


#step11
export temp=$(/sbin/sysctl -a 2>/dev/null | egrep "net.core.wmem_max =" | awk '{print $3}')
export temp1=$(/sbin/sysctl -a 2>/dev/null | egrep "net.core.wmem_max =")
if [[ $(echo ${temp}) -ge 2096304 ]]
then
  echo -e "${PASS} - Verified '"sysctl kernel variable check"' this should be '"net.core.wmem_max '>=' 2096304"' value is - \e[1;34m'"${temp1}"'\e[0m" 
else
  echo -e "${FAIL} - Verified '"sysctl kernel variable check"' this should be '"net.core.wmem_max '>=' 2096304"' value is - \e[1;34m'"${temp1}"'\e[0m"
fi


#step12
export temp=$(/sbin/sysctl -a 2>/dev/null | egrep "net.ipv4.ip_local_port_range =" | awk '{print $3 $4}')
export temp1=$(/sbin/sysctl -a 2>/dev/null | egrep "net.ipv4.ip_local_port_range =")
if [[ $(echo ${temp}) -eq 3276865535 ]]
then
  echo -e "${PASS} - Verified '"sysctl kernel variable check"' this should be '"ipv4_port_range: 32768 65535"' value is - \e[1;34m'"${temp1}"'\e[0m" 
else
  echo -e "${FAIL} - Verified '"sysctl kernel variable check"' this should be '"ipv4_port_range: 32768 65535"' value is - \e[1;34m'"${temp1}"'\e[0m"
fi

#step3
export temp=$(ulimit -Sn 2>/dev/null)
if [[ $temp -ge 4096 ]]
then
  echo -e "${PASS} - Verified Ulimit should be greater or equal to 4096 and value is - \e[1;34m'"${temp}"'\e[0m"
else
  echo -e "${FAIL} - Verified Ulimit should be greater or equal to 4096 and value is - \e[1;34m'"${temp}"'\e[0m"
fi

#step4
export temp=$(cat /proc/sys/net/ipv4/ip_local_port_range 2>/dev/null)
if [[ $(echo ${temp} | awk '{print $1}') -eq 32768 ]] && [[ $(echo ${temp} | awk '{print $2}') -eq 65535 ]]
then
  echo -e "${PASS} - Verified Ephemeral Port Range and ports should equal to 32768 and 65535 and they are - \e[1;34m'"${temp}"'\e[0m"
else
  echo -e "${FAIL} - Verified Ephemeral Port Range and ports should equal to 32768 and 65535 and they are - \e[1;34m'"${temp}"'\e[0m"
fi

#step5
export temp=$(getent group weblogic 2>/dev/null | cut -d ":" -f3)
if [[ $(echo ${temp}) = ! ]]
then
  echo -e "${FAIL} - Verified GUID check for weblogic user and - GUID is \e[1;34m'"${temp}"'\e[0m"
else
  echo -e "${PASS} - Verified GUID check for weblogic user and - GUID is \e[1;34m'"${temp}"'\e[0m"
fi

#step6
export temp=$(lsb_release -i -r 2>/dev/null | tail -1 | awk '{print $2}')
if [[ $(echo ${temp}| awk '{print substr($0,0,1)}') -ge 5 ]]
then
  echo -e "${PASS} - Verified RedHat Version it should be >=5.9 - as its Current Version is \e[1;34m'"${temp}"'\e[0m"
else
  echo -e "${FAIL} - Verified RedHat Version it should be >=5.9 - as its Current Version is \e[1;34m'"${temp}"'\e[0m"
fi

#step13
export temp=$(rpm -qa 2>/dev/null | grep libaio-devel| head -1 |awk '{print substr($1,18,3)}')
export temp1=$(rpm -qa 2>/dev/null | grep libaio-devel| head -1)
if [[ $(echo ${temp}) -ge 106 ]]
then
  echo -e "${PASS} - Package Verification must be greater or equal to '"libaio-devel-0.3.106"' and it is - \e[1;34m'"${temp1}"'\e[0m" 
else
  echo -e "${FAIL} - Package Verification must be greater or equal to '"libaio-devel-0.3.106"' and it is - \e[1;34m'"${temp1}"'\e[0m"
fi


#step14
export temp=$(rpm -qa 2>/dev/null | grep glibc-devel| head -1| awk '{print substr($1,15,2)}')
export temp1=$(rpm -qa 2>/dev/null | grep glibc-devel| head -1)
if [[ $(echo ${temp}) -ge 5 ]]
then
  echo -e "${PASS} - Package Verification must be greater or equal to '"glibc-devel-2.5"' and it is - \e[1;34m'"${temp1}"'\e[0m" 
else
  echo -e "${FAIL} - Package Verification must be greater or equal to '"glibc-devel-2.5"' and it is - \e[1;34m'"${temp1}"'\e[0m"
fi


#step15
export temp=$(rpm -qa 2>/dev/null | grep elfutils-libelf-devel| head -1| awk '{print substr($1,25,3)}')
export temp1=$(rpm -qa 2>/dev/null | grep elfutils-libelf-devel| head -1)
if [[ $(echo ${temp}) -ge 152 ]]
then
  echo -e "${PASS} - Package Verification must be greater or equal to '"elfutils-libelf-devel-0.152"' and it is - \e[1;34m'"${temp1}"'\e[0m" 
else
  echo -e "${FAIL} - Package Verification must be greater or equal to '"elfutils-libelf-devel-0.152"' and it is - \e[1;34m'"${temp1}"'\e[0m"
fi


#step16
export temp=$(rpm -qa 2>/dev/null | grep 'gcc-' | sort | head -1 | awk -F - '{print $2}' | grep [1-9] | awk '{print substr($1,1,1)}')
export temp1=$(rpm -qa 2>/dev/null | grep 'gcc-' | sort | head -1)
if [[ $(echo ${temp}) -ge 4 ]]
then
  echo -e "${PASS} - Package Verification must be greater or equal to '"gcc-4.1.1"' and it is  - \e[1;34m'"${temp1}"'\e[0m" 
else
  echo -e "${FAIL} - Package Verification must be greater or equal to '"gcc-4.1.1"' and it is  - \e[1;34m'"${temp1}"'\e[0m"
fi


#step17
export temp=$(rpm -qa 2>/dev/null | grep gcc-c++- | head -1| awk '{print substr($1,13,1)}')
export temp1=$(rpm -qa 2>/dev/null | grep gcc-c++- | head -1)
if [[ $(echo ${temp}) -ge 1 ]]
then
  echo -e "${PASS} - Package Verification must be greater or equal to '"gcc-c++-4.1.1"' and it is - \e[1;34m'"${temp1}"'\e[0m" 
else
  echo -e "${FAIL} - Package Verification must be greater or equal to '"gcc-c++-4.1.1"' and it is - \e[1;34m'"${temp1}"'\e[0m"
fi


#step18
export temp=$(rpm -qa 2>/dev/null | grep libstdc++-devel- | head -1| awk '{print substr($1,21,1)}')
export temp1=$(rpm -qa 2>/dev/null | grep libstdc++-devel- | head -1)
if [[ $(echo ${temp}) -ge 1 ]]
then
  echo -e "${PASS} - Package Verification must be greater or equal to '"libstdc++-devel-4.1.1"' and it is - \e[1;34m'"${temp1}"'\e[0m" 
else
  echo -e "${FAIL} - Package Verification must be greater or equal to '"libstdc++-devel-4.1.1"' and it is - \e[1;34m'"${temp1}"'\e[0m"
fi


#step19
export temp=$(echo -e "inst_group=weblogic\ninventory_loc=/app/oracle/oraInventory")
export temp1=$(cat /etc/oraInst.loc 2>/dev/null | sort | head -2)
if [[ $(ls /etc/oraInst.loc) == "/etc/oraInst.loc" && $(echo ${temp1}) == $(echo ${temp}) ]]
then
  echo -e "${PASS} - Verification of presence of Correct '"/etc/oraInst.loc"' file with content - \e[1;34m'"inventory_loc=/app/oracle/oraInventory and inst_group=weblogic"'\e[0m" 
else
  echo -e "${FAIL} - Verification of presence of Correct '"/etc/oraInst.loc"' file with content - \e[1;34m'"inventory_loc=/app/oracle/oraInventory and inst_group=weblogic"'\e[0m"
fi