ARG RASPBIAN_VERSION=buster
FROM resin/rpi-raspbian:$RASPBIAN_VERSION
ARG RASPBIAN_VERSION
ARG DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /usr/src/files
WORKDIR /usr/src/files

RUN sudo apt-get update && sudo apt-get upgrade && \
sudo apt-get install build-essential cmake pkg-config && \
sudo apt-get install libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev && \
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev && \
sudo apt-get install libxvidcore-dev libx264-dev && \
sudo apt-get install libgtk2.0-dev libgtk-3-dev && \
sudo apt-get install libatlas-base-dev gfortran && \
sudo apt-get install qtbase5-dev && \
sudo apt-get install qtdeclarative5-dev && \
sudo apt-get install python2.7-dev python3-dev &&\
apt-get install wget &&\
wget https://bootstrap.pypa.io/get-pip.py && \
sudo python3 get-pip.py && \
pip3 install numpy && \
apt-get install unzip


COPY installcv.sh /usr/src/files/
RUN chmod +x ./installcv.sh
RUN ./installcv.sh

RUN cd /usr/local/lib/python3.7/site-packages  && ls

RUN cd /usr/local/lib/python3.7/site-packages/ && \
  mv cv2.cpython-35m-arm-linux-gnueabihf.so cv2.so 
  
RUN /bin/bash -c "source ~/.bashrc"
#RUN apt-get install -y bzip2 && \
#    wget http://dlib.net/files/shape_predictor_68_face_landmarks.dat.bz2 && \
#bzip2 -d shape_predictor_68_face_landmarks.dat.bz2 


#RUN pip install opencv-contrib-python==4.1.0.25
COPY test.py /usr/src/files/
RUN python /usr/src/files/test.py