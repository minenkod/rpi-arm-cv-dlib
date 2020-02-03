

#wget https://bootstrap.pypa.io/get-pip.py 
#sudo python get-pip.py 
#sudo python3 get-pip.py
#pip install numpy
OPENCV_VERSION=3.3.0

WS_DIR=`pwd`
mkdir opencv
cd opencv

wget -O opencv.zip https://github.com/opencv/opencv/archive/$OPENCV_VERSION.zip && unzip opencv.zip
rm -rf opencv.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/$OPENCV_VERSION.zip && unzip opencv_contrib.zip
rm -rf opencv_contrib.zip

OPENCV_SRC_DIR=`pwd`/opencv-$OPENCV_VERSION
OPENCV_CONTRIB_MODULES_SRC_DIR=`pwd`/opencv_contrib-$OPENCV_VERSION/modules
# build and install
cd $OPENCV_SRC_DIR


echo -e 'folders inside ~'
ls
echo -e 'filepath'
pwd
 
cd $OPENCV_SRC_DIR
mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE \
  -D CMAKE_INSTALL_PREFIX=/usr/local \
  -D OPENCV_EXTRA_MODULES_PATH=$OPENCV_CONTRIB_MODULES_SRC_DIR \
  -D WITH_1394=OFF \
  -D WITH_FFMPEG=OFF ..
 
make -j4

make install

sudo ldconfig



# cleanup
cd $WS_DIR
rm -rf opencv

#https://github.com/mohaseeb/raspberrypi3-opencv-docker/blob/master/opencv_3/3.4.2/download_build_install_opencv.sh



#https://towardsdatascience.com/setting-up-raspberry-pi-for-computer-vision-installing-opencv-e0f973d38819
