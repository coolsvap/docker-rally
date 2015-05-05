#!/bin/bash
# Script to initialize the rally container and get results

/usr/local/bin/rally deployment create --filename=/home/rally/deployment.json --name=deployment
/usr/local/bin/rally verify start
/usr/local/bin/rally verify results --html --output-file=/home/rally/results.html
/usr/local/bin/rally verify results --json --output-file=/home/rally/results.json
