ARG RASPBIAN_VERSION=jessie
FROM resin/rpi-raspbian:$RASPBIAN_VERSION
ARG RASPBIAN_VERSION
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y wget && apt-get install bzip2 && \
sudo apt-get install build-essential cmake && \ 
apt install libtiff-dev zlib1g-dev -y && \
apt install libjpeg-dev libpng-dev -y && \
apt install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev -y && \
apt-get install libxvidcore-dev libx264-dev -y && \
apt-get install python3-pip && \
apt-get install zip unzip  && \
apt install python-numpy python3-numpy && \
apt-get install python3-setuptools && \
apt-get install libsqlite3-dev sqlite3 bzip2 libbz2-dev && \
apt-get install libssl-dev openssl libgdbm-dev liblzma-dev libreadline-dev && \
apt-get install libncursesw5-dev libffi-dev uuid-dev && \
apt-get install libgtk-3-dev && \
apt-get install libboost-all-dev && \
apt-get -y install libboost-python-dev && \
apt-get -y update 
#Unable to locate package libgdbm-compat-dev


RUN mkdir -p /usr/src/files
WORKDIR /usr/src/files

COPY installcv.sh /usr/src/files/
RUN chmod +x ./installcv.sh
RUN ./installcv.sh

RUN cd /usr/local/lib/python3.5/site-packages/ && \
  mv cv2.cpython-35m-arm-linux-gnueabihf.so cv2.so
  # && \
 # cd ~/.virtualenvs/cv/lib/python3.5/site-packages/ && \
 #   ln -s /usr/local/lib/python3.5/site-packages/cv2.so cv2.so

RUN /bin/bash -c "source ~/.bashrc"
RUN apt-get install -y bzip2 && \
    wget http://dlib.net/files/shape_predictor_68_face_landmarks.dat.bz2 && \
bzip2 -d shape_predictor_68_face_landmarks.dat.bz2 
#Test
RUN python -c 'import sys; print(sys.version_info[:])'
RUN pip install --upgrade opencv-python && pip install --upgrade pyinstaller

#RUN pip install opencv-contrib-python==4.1.0.25
COPY test.py /usr/src/files/
RUN python3 /usr/src/files/test.py