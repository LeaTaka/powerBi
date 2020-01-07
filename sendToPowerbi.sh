#!/bin/bash

function send_to_powerBI {
  REST_API_URL="https://api.powerbi.com/beta/fea0c9e8-3063-4898-88f8-cae45faaa84d/datasets/43aa2eca-2998-42e8-88dc-052f191bce61/rows?key=cC06gPAuOcmVBZJFxVO6Z354MAdvLg2W1HeEyLtu7Yum138L%2BW5MpCYZQZfLYeCXnO%2BmF%2F0lKKR2KlPS9SWbgA%3D%3D"
  curl -s -S --request POST --header "Content-Type: application/json" --data-binary "[${1}]" $REST_API_URL
}
TIMESTAMP=$(date +"%Y-%m-%dT%X.%3NZ")
TEMP=$(cat /sys/bus/w1/devices/28-051694ca60ff/w1_slave | sed -n 's/^.*\(t=[^ ]*\).*/\1/p' | sed 's/t=//' | awk '{x=$1}END{print int(x/1000)}')
powerBiDataSet=$(echo "{\"date\":\"${TIMESTAMP}\",\"temp\":${TEMP}}")
echo $powerBiDataSet
send_to_powerBI "${powerBiDataSet}"