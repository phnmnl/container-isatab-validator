#!/bin/bash

apk update && apk add ca-certificates && update-ca-certificates && apk add openssl
wget --no-check-certificate https://raw.githubusercontent.com/ISA-tools/ISAdatasets/master/tab/BII-I-1/i_investigation.txt
wget --no-check-certificate https://raw.githubusercontent.com/ISA-tools/ISAdatasets/master/tab/BII-I-1/s_BII-S-1.txt
wget --no-check-certificate https://raw.githubusercontent.com/ISA-tools/ISAdatasets/master/tab/BII-I-1/s_BII-S-2.txt
wget --no-check-certificate https://raw.githubusercontent.com/ISA-tools/ISAdatasets/master/tab/BII-I-1/a_metabolome.txt
wget --no-check-certificate https://raw.githubusercontent.com/ISA-tools/ISAdatasets/master/tab/BII-I-1/a_microarray.txt
wget --no-check-certificate https://raw.githubusercontent.com/ISA-tools/ISAdatasets/master/tab/BII-I-1/a_proteome.txt
wget --no-check-certificate https://raw.githubusercontent.com/ISA-tools/ISAdatasets/master/tab/BII-I-1/a_transcriptome.txt

isatab_validator.py . report.json report.html

# check that files were created
if ! [ -e "/report.json" ]; then
	echo "Validation report JSON file doesn't exist"
	exit 1
fi
if ! [ -e "/report.html" ]; then
	echo "Validation report HTML file doesn't exist"
	exit 1
fi

echo "All files created successfully"
