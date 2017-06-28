coreutils_version="coreutils-8.2"

case $OSTYPE in
    darwin*)
        macOS_config_params="gl_cv_func_stpncpy=yes"
        python_download_method="curl -o ls_colors_generator.py"
        coreutils_download_method="curl -o ${coreutils_version}.tar.xz"
        patch_download_method="curl -o ls.c"
        install_location="/usr/local/bin"
        ;;
    *)
        install_location="/usr/bin"
        python_download_method="wget"
        coreutils_download_method="wget"
        patch_download_method="wget"
        ;;
esac

$python_download_method http://raw.githubusercontent.com/illinoisjackson/even-better-ls/master/ls_colors_generator.py
chmod 755 ls_colors_generator.py
sudo mv ls_colors_generator.py /usr/bin/ls_colors_generator
$coreutils_download_method http://ftp.gnu.org/gnu/coreutils/${coreutils_version}.tar.xz
tar -xf ${coreutils_version}.tar.xz
rm ${coreutils_version}.tar.xz
cd ${coreutils_version}/src
rm -rf ls.c
$patch_download_method http://raw.githubusercontent.com/illinoisjackson/even-better-ls/master/ls.c
cd ..
./configure $macOS_config_params
make
cd src
sudo mv ls ${install_location}/ls-i
sudo mv dir ${install_location}/dir-i
sudo mv vdir ${install_location}/vdir-i
