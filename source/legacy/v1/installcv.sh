wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tgz 
tar zxf Python-3.7.0.tgz
cd Python-3.7.0 
sudo ./configure
sudo make -j 4
sudo make altinstall
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py 
pip install dlib
cd ~
echo "alias python='/usr/local/bin/python3.7'" >> .bashrc

. ~/.bashrc
echo 'Python installed'
python -c 'import sys; print(sys.version_info[:])'
whereis python

# && rm -rf /var/lib/apt/lists/*

wget https://github.com/sol-prog/raspberry-pi-opencv/releases/download/opencv4rpi2.1/opencv-4.1.0-armhf.tar.bz2
tar -xvf opencv-4.1.0-armhf.tar.bz2

#echo -e "installing pip and python"
#apt-get install python


mv opencv-4.1.0 /opt
rm opencv-4.1.0-armhf.tar.bz2


#set default python
#echo 'ln -s -f /usr/local/bin/python3.7 /usr/local/bin/python'


echo 'export LD_LIBRARY_PATH=/opt/opencv-4.1.0/lib:$LD_LIBRARY_PATH' >> .bashrc
#. ~/.bashrc
ln -s /opt/opencv-4.1.0/lib/python2.7/dist-packages/cv2 /usr/lib/python2.7/dist-packages/cv2
ln -s /opt/opencv-4.1.0/lib/python3.7/dist-packages/cv2 /usr/lib/python3/dist-packages/cv2
#ln -s /opt/opencv-4.1.0/lib/python3.7/dist-packages/cv2 /usr/lib/python3.7/dist-packages/cv2

#dlib dependcies

#pip install dlib