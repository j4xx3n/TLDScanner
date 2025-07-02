#!/usr/bin/env python3

import whois
import argparse

parser = argparse.ArgumentParser(description="python3 tldscanner.py -d example.com")

parser.add_argument("-d", type=str, help="python3 tldscanner.py -d example.com")

args = parser.parse_args()

mainDomain = args.d

mw = whois.whois(args.d)
mainOrg = mw.org
print(f"{mainDomain}:{mainOrg}")