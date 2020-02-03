
Built on an ARM Raspberry pi 4B+

Dlib with Shape predictor + Opencv + Python 2.7



Instructions

Clone the repo

docker build -t imageNameHere .

With the image built locally you may use it as part of your own dockefile like this: 

____________________



FROM imageNameHere

.........
......
(You are now in an environment capable of using opencv and dlib) 
