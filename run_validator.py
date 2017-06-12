#!/usr/bin/env python3

import sys
import os
import zipfile
import shutil
import json

isa_archive = sys.argv[1]
try:
    from isatools import isatab
except ImportError as e:
    raise RuntimeError("Could not import isatools package")
if not os.path.exists(isa_archive):
    print("File path to ISArchive ZIP file \"{}\" does not exist".format(isa_archive))
    sys.exit(0)
report = None
with zipfile.ZipFile(isa_archive, 'r') as z:
    z.extractall('./tmp')
    i_files = [f for f in z.filelist if os.path.basename(f.filename).startswith('i_')]
    print(i_files)
    if len(i_files) == 1:
        print("Loading: " + os.path.join('tmp', i_files[0].filename))
        with open(os.path.join('tmp', i_files[0].filename)) as in_fp:
            json_report = isatab.validate(in_fp)
            if json_report is not None:
                 with open("report.json", "w") as out_fp:
                     json.dump(json_report, out_fp)
shutil.rmtree('./tmp')
