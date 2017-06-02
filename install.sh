wget http://raw.githubusercontent.com/illinoisjackson/even-better-ls/master/ls_colors_generator.py
chmod 777 ls_colors_generator.py
sudo mv ls_colors_generator.py /usr/bin/ls_colors_generator
wget http://ftp.gnu.org/gnu/coreutils/coreutils-8.2.tar.xz
tar -xf coreutils-8.2.tar.xz
rm coreutils-8.2.tar.xz
cd coreutils-8.2/src
rm -rf ls.c
wget http://raw.githubusercontent.com/illinoisjackson/even-better-ls/master/ls.c
cd ..
./configure
make
cd src
sudo mv ls /usr/bin/ls-i 
sudo mv dir /usr/bin/dir-i
sudo mv vdir /usr/bin/vdir-i
