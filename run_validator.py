import sys
import os
import zipfile

isa_archive = sys.argv[1]
try:
    from isatools import isatab
except ImportError as e:
    raise RuntimeError("Could not import isatools package")
with zipfile.ZipFile(isa_archive, 'r') as z:
    z.extractall('./')
    i_files = [f for f in z.filelist if os.path.basename(f.filename).startswith('i_')]
    print(i_files)
    if len(i_files) == 1:
        print("Loading: " + i_files[0].filename)
        log_msg_stream = isatab.validate2(open(i_files[0].filename))
