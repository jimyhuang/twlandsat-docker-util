# DOCKER-VERSION 1.2.0
# TO jimyhuang/twlandsat-utils
FROM ubuntu:trusty

# install steps from  https://github.com/developmentseed/landsat-util
RUN apt-get install -y software-properties-common curl
RUN apt-add-repository ppa:ubuntugis/ubuntugis-unstable
RUN apt-get update && apt-get install -y git python-pip build-essential libssl-dev libffi-dev python-dev python-gdal libgdal1-dev gdal-bin imagemagick geotiff-bin otb-bin otb-bin-qt
RUN pip install -U git+git://github.com/developmentseed/landsat-util.git

# install mb-util
WORKDIR /home
RUN git clone https://github.com/mapbox/mbutil.git
RUN cd mbutil && python setup.py install

# clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
