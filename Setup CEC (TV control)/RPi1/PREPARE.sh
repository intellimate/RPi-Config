# Build this platform thing
cd /libcec/src/platform
mkdir build
cd build

cmake -DCMAKE_CXX_COMPILER=g++-4.8 ..
make
make install
checkinstall

# Make libcec
cd /libcec
mkdir build
cd build
cmake -DCMAKE_CXX_COMPILER=g++-4.8 -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=1 ..
make
