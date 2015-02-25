#!/bin/bash

/usr/local/bin/rally deployment create --filename=/home/rally/deployment.json --name=deployment
/usr/local/bin/rally verify start
/usr/local/bin/rally verify results --html --output-file=/home/rally/results.html
/usr/local/bin/rally verify results --html --output-file=/home/rallyresults.json
