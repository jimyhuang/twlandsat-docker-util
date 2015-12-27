# DOCKER-VERSION 1.2.0
# TO jimyhuang/twlandsat-utils
FROM ubuntu:trusty

# install steps from  https://github.com/developmentseed/landsat-util
RUN apt-get update && apt-get install -y software-properties-common curl
RUN apt-add-repository ppa:ubuntugis/ubuntugis-unstable
RUN apt-get update && apt-get install -y git python-pip build-essential libssl-dev libffi-dev python-dev python-gdal gdal-bin imagemagick geotiff-bin otb-bin otb-bin-qt libgdal-dev libgdal1h

# install some python tools
WORKDIR /home
RUN apt-get update && apt-get install -y python-numpy python-scipy libatlas-base-dev gfortran libfreetype6-dev
RUN pip install -U git+https://github.com/developmentseed/landsat-util/#egg=landsat-util
RUN git clone https://github.com/mapbox/mbutil.git
RUN cd mbutil && python setup.py install

# clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
