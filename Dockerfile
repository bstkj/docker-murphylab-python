FROM ubuntu:latest

MAINTAINER Ivan E. Cao-Berg <icaoberg@andrew.cmu.edu>
LABEL Description="Personal container for development at the Murphy Lab in the Computational Biology Department at Carnegie Mellon University."
LABEL Vendor="Carnegie Mellon University"
LABEL Version="0.1"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update --fix-missing
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y build-essential git python python-dev python-setuptools nginx supervisor bcrypt libssl-dev libffi-dev libpq-dev vim redis-server rsyslog wget
RUN apt-get install -y python-numpy python-scipy python-matplotlib
RUN easy_install pip
RUN pip install ipython
RUN pip install sphinx
RUN pip install tabulate
RUN pip install scikit-learn
RUN pip install pandas
RUN pip install Pillow

# Configure environment
ENV SHELL /bin/bash
ENV USERNAME icaoberg
ENV UID 1000
RUN useradd -m -s /bin/bash -N -u $UID $USERNAME
RUN if [ ! -d /home/$USERNAME/ ]; then mkdir /home/$USERNAME/; fi
WORKDIR /home/$USERNAME/
USER $USERNAME