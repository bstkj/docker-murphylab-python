FROM ubuntu:16.04

MAINTAINER Ivan E. Cao-Berg <icaoberg@andrew.cmu.edu>
LABEL Description="Personal container for development at the Murphy Lab in the Computational Biology Department at Carnegie Mellon University."
LABEL Vendor="Carnegie Mellon University"
LABEL Version="0.1"

# Install vi and all needed packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update --fix-missing
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y build-essential git python python-dev python-setuptools nginx supervisor bcrypt libssl-dev libffi-dev libpq-dev vim redis-server rsyslog wget
RUN apt-get install -y python-numpy python-scipy python-matplotlib
RUN apt-get install -y pandoc texlive-full
RUN easy_install pip
RUN pip install ipython
RUN pip install sphinx
RUN pip install tabulate
RUN pip install scikit-learn
RUN pip install pandas
RUN pip install Pillow
RUN pip install javabridge python-bioformats

# Configure environment
ENV SHELL /bin/bash
ENV USERNAME icaoberg
ENV UID 1000
RUN useradd -m -s /bin/bash -N -u $UID $USERNAME
RUN if [ ! -d /home/$USERNAME/ ]; then mkdir /home/$USERNAME/; fi
WORKDIR /home/$USERNAME/

# Create bindings, needed for CBD HPC computing
RUN mkdir /scratch
RUN mkdir /share
RUN mkdir /images
RUN mkdir /projects
RUN mkdir /containers

# prepare IDE
USER $USERNAME
RUN git clone https://github.com/icaoberg/vim-as-an-ide.git && mv vim-as-an-ide/vimrc.vim ~/.vimrc && rm -rf vim-as-an-ide
RUN mkdir ~/.vim && git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
RUN git clone https://github.com/Yggdroot/duoduo.git && mv duoduo/colors ~/.vim/ && rm -rf duoduo
RUN sed -i 's/solarized/duoduo/g' ~/.vimrc
RUN sed -i 's/nerdtree_tabs_open_on_console_startup = 0/nerdtree_tabs_open_on_console_startup = 1/g' ~/.vimrc
RUN vim +PluginInstall +qall
