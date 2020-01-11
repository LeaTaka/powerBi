#!/bin/bash

temp=jq .temperature cfg.json
timestamp=$(date +"%Y-%m-%dT%X.%3NZ")
powerBiDataSet=$(echo "{\"date\":\"${timestamp}\",\"temp\":${temp}}")

function send_to_powerBI {
  powerBiUrl=jq .powerBiUrl cfg.json
  curl -s -S --request POST --header "Content-Type: application/json" --data-binary "[${1}]" $powerBiUrl
}

# Optional DS18B20 temperature sensor script
#temp=$(cat /sys/bus/w1/devices/28-051694ca60ff/w1_slave | sed -n 's/^.*\(t=[^ ]*\).*/\1/p' | sed 's/t=//' | awk '{x=$1}END{print int(x/1000)}')

echo $powerBiDataSet
send_to_powerBI "${powerBiDataSet}"