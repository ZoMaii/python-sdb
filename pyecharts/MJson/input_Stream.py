import json

def fileJsonOpen(URL,Way='r',code='utf-8'):
    with open(URL,Way,encoding=code) as file:
        str = file.readlines()[0].replace('jsonp_1629350871167_29498(',"")[:-2]
        return json.loads(str)

