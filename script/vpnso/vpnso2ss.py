#!/usr/bin/env python3

import sys
json_file = sys.argv[1]
print("file name: " + json_file)

import json
with open(json_file) as json_data:
    data = json.load(json_data)

configs = ["{}:{}@{}:{}".format(
            c["method"], c["password"], c["server"], c["server_port"])
            for c in data["configs"]]

import base64
ss = [base64.urlsafe_b64encode(bytes(x, "utf8")) for x in configs]

for s in ss:
    print(str(s, "utf8"))
