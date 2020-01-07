#!/usr/bin/env python3

import datetime
import requests
import json
temp = 10
def sendToPowerBi():
    try:
        timestamp = datetime.datetime.now().strftime('%Y-%m-%dT%H:%M:%S.%f')[:-3]+'Z'
        powerBiUrl = "https://api.powerbi.com/beta/fea0c9e8-3063-4898-88f8-cae45faaa84d/datasets/43aa2eca-2998-42e8-88dc-052f191bce61/rows?key=cC06gPAuOcmVBZJFxVO6Z354MAdvLg2W1HeEyLtu7Yum138L%2BW5MpCYZQZfLYeCXnO%2BmF%2F0lKKR2KlPS9SWbgA%3D%3D"
        data = [{"temp": temp, "date": timestamp}]
        response = requests.post(powerBiUrl, json.dumps(data))
        #return(response.status_code)
        return(response.reason)
    except:
        pass
print(sendToPowerBi())