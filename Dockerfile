FROM isatools/isatools:3.6-slim-stretch-0.9.4

MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL Description="Validate an ISA tab archive (zip)"
LABEL software.version="0.9.4"
LABEL version="0.3"
LABEL software="isatab-validator"


ADD run_test.sh /usr/local/bin/run_test.sh
RUN chmod a+x /usr/local/bin/run_test.sh

ADD run_validator.py /usr/local/bin/run_validator.py
RUN chmod a+x /usr/local/bin/run_validator.py

ENTRYPOINT ["run_validator.py"]
