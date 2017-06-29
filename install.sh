coreutils_version="coreutils-8.2"

case $OSTYPE in
    darwin*)
        macOS_config_params="gl_cv_func_stpncpy=yes"
        download_method="curl -o"
        install_location="/usr/local/bin"
        ;;
    *)
        download_method="wget -O"
        install_location="/usr/bin"
        ;;
esac

$download_method ls_colors_generator.py http://raw.githubusercontent.com/illinoisjackson/even-better-ls/master/ls_colors_generator.py
chmod 755 ls_colors_generator.py
sudo mv ls_colors_generator.py ${install_location}/ls_colors_generator
$download_method ${coreutils_version}.tar.xz http://ftp.gnu.org/gnu/coreutils/${coreutils_version}.tar.xz
tar -xf ${coreutils_version}.tar.xz
rm ${coreutils_version}.tar.xz
cd ${coreutils_version}/src
rm -rf ls.c
$download_method ls.c http://raw.githubusercontent.com/illinoisjackson/even-better-ls/master/ls.c
cd ..
./configure $macOS_config_params
make
cd src
sudo mv ls ${install_location}/ls-i
sudo mv dir ${install_location}/dir-i
sudo mv vdir ${install_location}/vdir-i
