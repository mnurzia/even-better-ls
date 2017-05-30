wget http://ftp.gnu.org/gnu/coreutils/coreutils-8.2.tar.xz
tar -xf coreutils-8.2.tar.xz
cd coreutils-8.2/src
rm -rf ls.c
wget http://raw.githubusercontent.com/illinoisjackson/even-better-ls/master/ls.c
cd ..
./configure
make
cd src
mv ls /bin/ls-i # mv dir /bin/dir-i; mv vdir /bin/vdir-i
