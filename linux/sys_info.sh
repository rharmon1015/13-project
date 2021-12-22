#!/usr/bin/env bash

# Check if running as root
if [ $UID = 0 ]
then
    echo "Please don't run this script as root, it's not good for you"
    exit
fi

# Variable Declaration
output=$HOME/research/sys_info.txt
ip=$(ip addr | head -9 | tail -1)
full_perms=$(sudo find /home -type f -perm 777)
paths=(
    '/etc/passwd'
    '/etc/shadow'
)

commands=(
    'date'
    'uname -a'
    'hostname -s'
)
# mkdir -p ~/research
# Check for research directory
if [ ! -d ~/research ]
then
    mkdir ~/research
fi

if [ -f $output ]
then 
    rm $output 
fi
# Print title
echo "System Audit Script" >> $output

for x in {0..2};
do
    results=$(${commands[$x]})
    echo "Results of \"${commands[$x]}\" command:" >> $output
    echo $results >> $output
    echo "" >> $output
done

# Print uname system info
# echo -e "\nUname information: $(uname)\n" >> $output

# Print IP
echo -e "\nIP Information: $ip \n" >> $output

# Print hostname
# echo -e "\nHostname: $HOSTNAME\n" >> $output

# Bonus Section

#Print DNS Resolver and Info
echo -e "\nDNS Information: \n$(cat /etc/resolv.conf)\n"  >> $output

# Print Memory Info
echo -e "Memory Information:  \n$(free -h)\n"  >> $output

# Print CPU Info
echo -e "\nCPU Info: \n$)lscpu | grep CPU)"  >> $output

# Print Disk Usage Info
echo -e "\nDisk Usage: \n$(df -H | head -2)"  >> $output

# Print current user session
echo -e "\nWho is currently logged in: \n $(who -a) \n"  >> $output

# Print files with '777' permisions in hime dirs
echo -e  "\n '777' files in the home directory: \n"  >> $output

echo $full_perms >> $output

# Print Top 10 Processes
echo -e "\nTop 10 Processes on $HOSTNAME: \n $(ps aux --sort -%mem | awk '{print $1, $2, $3, $4, $11}' | head -11)" >> $output

# Long listing of /etc/shadow and /etc/passwd
for path in ${paths[@]};
do
    ls -l $path >> $output
done

echo -e "\nPrinitng home dir user's sudo persmissions\n" >> $output
for user in $(ls /home);
do
    sudo -lU $user >> $output
done