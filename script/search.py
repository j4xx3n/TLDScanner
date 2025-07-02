#!/usr/bin/env python3

import whois
import argparse
import logging
from concurrent.futures import ThreadPoolExecutor, as_completed 

# Suppress whois logger output
logging.getLogger("whois.whois").setLevel(logging.CRITICAL)

parser = argparse.ArgumentParser(description="python3 tldscanner.py -d example.com")

parser.add_argument("-d", type=str)
parser.add_argument("-o", type=str)
args = parser.parse_args()

domains = []

with open('wordlists/topUsedTlds.txt', 'r') as file:
    for tld in file:
        tld = tld.strip()
        domains.append(f"{args.d}{tld}")


data = {}
for domain in domains:
    try:
        w = whois.whois(domain)
        data[domain] = w
    except Exception as e:
        pass

for domain, w in data.items():
    org = w.org
    if org == args.o:
        print(f"[+] Found: {domain}: {org}")