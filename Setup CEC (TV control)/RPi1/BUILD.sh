# Build libcec
cd /libcec/build
sudo -s
export LIBRARY_PATH=/opt/vc/lib
make install
checkinstall
