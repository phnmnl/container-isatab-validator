FROM python:3-onbuild
LABEL Description="Validate an ISA tab archive (zip)"
MAINTAINER David Johnson, david.johnson@oerc.ox.ac.uk
RUN pip install isatools --upgrade
ADD run_validator.py /
ADD requirements.txt /
ENTRYPOINT ["python", "run_validator.py"]
