wget http://software.intel.com/sites/landingpage/pintool/downloads/pin-2.14-71313-gcc.4.4.7-linux.tar.gz
tar zxvf pin*
rm pin*gz
mv pin* pin
export PIN_ROOT=$(pwd)/pin
echo 0 | sudo tee /proc/sys/kernel/randomize_va_space
echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

# Install EWAGBoolArray
git clone https://github.com/lemire/EWAHBoolArray
sudo cp EWAHBoolArray/headers/* /usr/include/
rm -rf EWAHBoolArray

# Install bmagic
sudo apt-get install bmagic

# Install bitvector
sudo pip2 install virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh
mkvirtualenv vuzzer -p /usr/bin/python2
pip install bitvector

# Make the pintools
make support-libdft
make
make -f mymakefile
