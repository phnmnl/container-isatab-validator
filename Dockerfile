FROM ubuntu:16.04

MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL Description="Validate an ISA tab archive (zip)"
LABEL software.version="0.8.0"
LABEL version="0.2"
LABEL software="isatab-validator"

RUN apt-get update && apt-get install -y --no-install-recommends build-essential libssl-dev libffi-dev python3-dev python3-pip && \
    pip3 install --upgrade pip && \
    pip3 install -U setuptools && \
    pip3 install isatools==0.8.0 && \
    apt-get purge -y python3-pip gcc libxml2-dev libxslt-dev python3-lxml build-essential libssl-dev libffi-dev python3-dev && \
    apt-get install --no-install-recommends python3 && \
    apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD run_test.sh /usr/local/bin/run_test.sh
RUN chmod a+x /usr/local/bin/run_test.sh

ADD run_validator.py /usr/local/bin/run_validator.py
RUN chmod a+x /usr/local/bin/run_validator.py

ENTRYPOINT ["run_validator.py"]
