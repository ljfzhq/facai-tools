#!/usr/bin/env python3

import sys
json_file = sys.argv[1]

import json
with open(json_file) as json_data:
    json_str = json.dumps(json.load(json_data))

import base64
byte_res = base64.urlsafe_b64encode(bytes(json_str, "utf8"))
print(str(byte_res, "utf8"))
