#!/bin/bash
####################
#### Variables ####
####################



echo "Please provide the OOB IP address of the host you are trying to reach:"
read -p 'IP address: ' host_ip
clear
read -p "-------------------------[Command List]--------------------------------------------
shell     | power on     | sol activate   | chassis bootdev pxe (disk, etc..)     |
sdr       | power off    | sol deactivate | mc reset cold (warm, etc..)           |
fru       | power status | sol info       | set volatile-bit-rate (115.2, 9.6)    |
sel list  | sensor list  | sel get 0x##   | set non-volatile-bit-rate (115.2, 9.6)|
sel clear | grep -i      |                |                                       |
-----------------------------------------------------------------------------------
Please enter your command: " command
    
clear

ipmi_warlock="ipmitool -I lanplus -U Administrator -P Password -H $host_ip $command"
ipmi_gnc="ipmitool -I lanplus -U Administrator -P Password -H $host_ip $command"
ipmi_kratos="ipmitool -I lanplus -U Administrator -P Password -H $host_ip $command"
ipmi_poseidon="ipmitool -I lanplus -U Administrator -P Password -H $host_ip $command"
ipmi_cloudberry="ipmitool -I lanplus -U Administrator -P Password -H $host_ip $command"
ipmi_cloudberryadmin="ipmitool -I lanplus -U Administrator -P Password -H $host_ip $command"
ipmi_outofstock="ipmitool -I lanplus -U Administrator -P Password -H $host_ip $command"
ipmi_hop="ipmitool -I lanplus -U Administrator -P Password -H $host_ip $command"
ipmi_lightyear="ipmitool -I lanplus -U Administrator -P Password -H $host_ip $command"
crucible="pv-crucible-oob.nsd.cromcruach.com"


#######################################
#### User Prompt Function and Array ####
########################################

prompt_user () {
      echo ""
      message="Please select the IPMI login you are looking for:"
      echo "$message"
      echo ""
      echo "IPMI Aliases"
      echo "1: Warlock"
      echo "2: GNC"
      echo "3: Kratos"
      echo "4: Poseidon"
      echo "5: Cloudberry"
      echo "6: Cloudberry Admin"
      echo "7: Out of Stock"
      echo "8: Hop "
      echo "9: Lightyear "
      echo "10: EXIT"
      echo ""
      case "$REPLY" in
      1) $ipmi_warlock;;
      2) $ipmi_gnc;;
      3) $ipmi_kratos;;
      4) $ipmi_poseidon;;
      5) $ipmi_cloudberry;;
      6) $ipmi_cloudberryadmin;;
      7) $ipmi_outofstock;;
      8) $ipmi_hop;;
      9) $ipmi_lightyear;;
      10) exit;;
      esac
      read -p "IPMI Login: "  #
      clear
      }


#################################
#### After Selection Actions ####
#################################


 prompt_user
   if [[ $REPLY == "1" ]]; then
   ssh -t "$crucible" "$ipmi_warlock"
   elif [[ $REPLY == "2" ]]; then
   ssh -t "$crucible" "$ipmi_gnc"
   elif [[ $REPLY == "3" ]]; then
   ssh -t "$crucible" "$ipmi_kratos"
   elif [[ $REPLY == "4" ]]; then
   ssh -t "$crucible" "$ipmi_poseidon"
   elif [[ $REPLY == "5" ]]; then
   ssh -t "$crucible" "$ipmi_cloudberry"
   elif [[ $REPLY == "6" ]]; then
   ssh -t "$crucible" "$ipmi_cloudberryadmin"
   elif [[ $REPLY == "7" ]]; then
   ssh -t "$crucible" "$ipmi_outofstock"
   elif [[ $REPLY == "8" ]]; then
   ssh -t "$crucible" "$ipmi_hop"
   elif [[ $REPLY == "9" ]]; then
   ssh -t "$crucible" "$ipmi_lightyear"
   else
    echo "Login selected is incorrect. Please try another one."
   fi
