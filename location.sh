#!/bin/bash
figlet -f slant -k "IP - Hunter " | lolcat
echo -e "# This tool can gather information about any ip adress." | lolcat
echo -e "# Tool is created by Parvez-404 .(v1.0)" | lolcat
echo -e "--------------------------------------------------------\n" | lolcat
echo -n "Enter the target IP : " |lolcat
read ip_add

res=$(curl -s http://ip-api.com/json/$ip_add)
status=$(echo $res | jq '.status' -r)

# Check if the status is "success"
if [ "$status" == "success" ]; then
    echo -e "Successfully fetched the information.\n" | lolcat

    # Extract and display information
    country=$(echo $res | jq '.country' -r)
    echo "Country : $country"

    region=$(echo $res | jq '.regionName' -r)
    echo "Region : $region"

    city=$(echo $res | jq '.city' -r)
    echo "City : $city"

    zip=$(echo $res | jq '.zip' -r)
    echo "Zip Code : $zip"

    lat=$(echo $res | jq '.lat' -r)
    lon=$(echo $res | jq '.lon' -r)
    echo "Location : long($lon) , lat($lat)"

    isp=$(echo $res | jq '.isp' -r)
    echo "ISP : $isp"

    timezone=$(echo $res | jq '.timezone' -r)
    echo "Time Zone : $timezone"
else
    echo "Can't find information."
    exit 1
fi

echo -e "\n--------------------------------------------------------\n" | lolcat
