# Install packages
yes Y | apt-get install git cmake g++-4.8 checkinstall liblockdev1-dev libudev-dev libxrandr-dev python-dev swig
yes Y | apt-get install libraspberrypi-dev
apt-get install cec-utils

# Download sources
cd /
git clone --recursive https://github.com/Pulse-Eight/libcec.git
