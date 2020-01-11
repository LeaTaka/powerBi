#!/usr/bin/env python3

import datetime
import requests
import json
import os

# json file that has a sample temperature value and the powerBi url + secret
with open(os.path.join(sys.path[0], "cfg.json"), "r") as f:
    cfg = json.load(f)

def sendToPowerBi():
    try:
        timestamp = datetime.datetime.now().strftime('%Y-%m-%dT%H:%M:%S.%f')[:-3]+'Z'
        powerBiUrl = 
        data = [{"temp": cfg['temperature'], "date": timestamp}]
        response = requests.post(cfg['powerBiUrl'], json.dumps(data))
        #return(response.status_code)
        return(response.reason)
    except:
        pass
print(sendToPowerBi())