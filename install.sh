wget https://raw.githubusercontent.com/illinoisjackson/even-better-ls/master/ls_colors_generator.py
chmod 755 ls_colors_generator.py
sudo mv ls_colors_generator.py /usr/bin/ls_colors_generator
wget https://ftp.gnu.org/gnu/coreutils/coreutils-8.31.tar.xz
tar -xf coreutils-8.31.tar.xz
rm coreutils-8.31.tar.xz
cd coreutils-8.31/src
rm -rf ls.c
wget https://raw.githubusercontent.com/illinoisjackson/even-better-ls/master/ls.c
cd ..
./configure
make
cd src
sudo mv ls /usr/bin/ls-i
sudo mv dir /usr/bin/dir-i
sudo mv vdir /usr/bin/vdir-i
