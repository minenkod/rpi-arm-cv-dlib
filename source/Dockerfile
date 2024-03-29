#!/bin/bash 
FROM resin/rpi-raspbian:stretch
#https://matchboxdorry.gitbooks.io/matchboxblog/content/blogs/build_and_run_arm_images.html
#qemu 

COPY qemu-arm-static /usr/bin/qemu-arm-static
#
ARG RASPBIAN_VERSION=stretch

ARG RASPBIAN_VERSION
ARG DEBIAN_FRONTEND=noninteractive

# install opencv3 as detailied in: https://www.pyimagesearch.com/2017/09/04/raspbian-stretch-install-opencv-3-python-on-your-raspberry-pi/
RUN  apt upgrade
# update apt
RUN apt-get update \
	&& apt-get install -y --no-install-recommends apt-utils \
	# install necessary build tools \
	&& apt-get -qy install build-essential cmake pkg-config unzip wget \
	# install necessary libraries \
	&& apt-get -qy install \
		libjpeg-dev \
		libtiff5-dev \
		libjasper-dev \
		libpng12-dev \
		libavcodec-dev \
		libavformat-dev \
		libswscale-dev \
		libv4l-dev \
		libxvidcore-dev \
		libx264-dev \
	#Had to break the install into chunks as the deps wouldn't resolve.  \
	&& apt-get -qy install \
		libgtk2.0-dev \
		libgtk-3-dev \
		libatlas-base-dev \
		gfortran \
		python2.7-dev \
		python3-dev \
		python-pip \
		python-numpy \
		python3-pip \
		python3-numpy \
		libraspberrypi0 \
		python-setuptools \
		python3-setuptools \
	# cleanup apt. \
	&& apt-get purge -y --auto-remove \
	&& rm -rf /var/lib/apt/lists/*

ARG OPENCV_VERSION=4.5.4
ENV OPENCV_VERSION $OPENCV_VERSION

	# download latest source & contrib
RUN	cd /tmp \
	&& wget -c -N -nv -O opencv.zip https://github.com/opencv/opencv/archive/$OPENCV_VERSION.zip \
	&& unzip opencv.zip \
	&& wget -c -N -nv -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/$OPENCV_VERSION.zip \
	&& unzip opencv_contrib.zip \
	# build opencv \
	&& cd /tmp/opencv-$OPENCV_VERSION \
	&& mkdir build \
	&& cd build \
	&& cmake -D CMAKE_BUILD_TYPE=RELEASE \
		-D CMAKE_INSTALL_PREFIX=/usr/local \
		-D INSTALL_C_EXAMPLES=ON \
		-D BUILD_PYTHON_SUPPORT=ON \
		-D BUILD_NEW_PYTHON_SUPPORT=ON \
		-D INSTALL_PYTHON_EXAMPLES=ON \
		-D OPENCV_EXTRA_MODULES_PATH=/tmp/opencv_contrib-$OPENCV_VERSION/modules \
		-D BUILD_EXAMPLES=ON .. \
	&& make -j4  \
	&& make \
	&& make install\
	# ldconfig && \
	&& make clean \
	# cleanup source \
	&& cd / \
	&& rm -rf /tmp/* \
	&& pip install imutils picamera \
	&& pip3 install imutils picamera \
        && date \
        && echo "Raspbian $RASPBIAN_VERSION - OpenCV $OPENCV_VERSION Docker Build finished."

ARG VCS_REF
ARG BUILD_DATE
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/sgtwilko/rpi-raspbian-opencv"

CMD ["/bin/bash"]
#http://dlib.net/files/shape_predictor_68_face_landmarks.dat.bz2
#wget -nd https://github.com/JeffTrain/selfie/raw/master/shape_predictor_68_face_landmarks.dat
WORKDIR /usr/src/files
RUN apt-get install -y bzip2 && \
 wget -nd https://github.com/JeffTrain/selfie/raw/master/shape_predictor_68_face_landmarks.dat  && \
pip install wheel && \
pip install dlib

RUN pip list && whereis dlib
COPY test.py /usr/src/files/
RUN python /usr/src/files/test.py

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.7 1
RUN update-alternatives --set python /usr/bin/python3.7
#bzip2 -d shape_predictor_68_face_landmarks.dat.bz2 

#part2
#WORKDIR /myapp
#ADD ./temp-flask /myapp
#RUN chmod +x requirements.txt
#RUN pip install -r requirements.txt
