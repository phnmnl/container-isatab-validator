import sys
import os
import zipfile
import shutil

isa_archive = sys.argv[1]
try:
    from isatools import isatab
except ImportError as e:
    raise RuntimeError("Could not import isatools package")
log_msg_stream = None
with zipfile.ZipFile(isa_archive, 'r') as z:
    z.extractall('./tmp')
    i_files = [f for f in z.filelist if os.path.basename(f.filename).startswith('i_')]
    print(i_files)
    if len(i_files) == 1:
        print("Loading: " + os.path.join('tmp', i_files[0].filename))
        log_msg_stream = isatab.validate2(open(os.path.join('tmp', i_files[0].filename)))
if log_msg_stream is not None:
    with open('log.txt', 'w') as f:
        f.write(log_msg_stream.getvalue())
shutil.rmtree('./tmp')
