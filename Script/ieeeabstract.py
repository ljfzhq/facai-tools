#!/bin/python

import sys
import urllib.request
from bs4 import BeautifulSoup
import re

target_url = sys.argv[1]
print(target_url, file=sys.stderr)
ieee = "http://ieeexplore.ieee.org"

content = urllib.request.urlopen(target_url).read()
#print(content, file=sys.stderr)
parser = BeautifulSoup(content)
items = parser.find_all('a', {'class':'art-abs-url'})
print(len(items), file=sys.stderr)

index = 0
for item in items:
    item_url = ieee+item['href']
    print(index, file=sys.stderr)
    index = index + 1

    item_content = urllib.request.urlopen(item_url).read()
    item_parser = BeautifulSoup(item_content)
    item_title = re.sub('\r|\t|\n','',item_parser.title.get_text())
    item_title = re.sub('IEEE Xplore Abstract  - ', '', item_title)
    print('####', '[', item_title, '](', item_url, ')')

    item_abstract = item_parser.find(id="articleDetails")
    item_raw = item_abstract.get_text()

    item_text = re.split('Published *in:', item_raw)[0]
    item_text= re.sub('\n|\r|\t','\n', item_text)
    item_text = re.sub('[\n ]*\n','\n', item_text)

    print(item_text)


