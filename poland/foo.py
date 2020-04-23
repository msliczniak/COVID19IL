#!/usr/bin/env python2.7
from json import load
from sys import stdin, stdout

stdout.write(load(stdin)['query']['pages'][0]['revisions'][0]['content'])
stdout.flush()
