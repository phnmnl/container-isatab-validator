#!/bin/bash

apk update && apk add ca-certificates && update-ca-certificates && apk add openssl
wget --no-check-certificate https://raw.githubusercontent.com/ISA-tools/ISAdatasets/master/tab/BII-I-1/i_investigation.txt
wget --no-check-certificate https://raw.githubusercontent.com/ISA-tools/ISAdatasets/master/tab/BII-I-1/s_BII-S-1.txt
wget --no-check-certificate https://raw.githubusercontent.com/ISA-tools/ISAdatasets/master/tab/BII-I-1/s_BII-S-2.txt
wget --no-check-certificate https://raw.githubusercontent.com/ISA-tools/ISAdatasets/master/tab/BII-I-1/a_metabolome.txt
wget --no-check-certificate https://raw.githubusercontent.com/ISA-tools/ISAdatasets/master/tab/BII-I-1/a_microarray.txt
wget --no-check-certificate https://raw.githubusercontent.com/ISA-tools/ISAdatasets/master/tab/BII-I-1/a_proteome.txt

run_validator.py .

# check that files were created
if ! [ -e "/report.json" ]; then
	echo "Validation report file doesn't exist"
	exit 1
fi

echo "All files created successfully"
