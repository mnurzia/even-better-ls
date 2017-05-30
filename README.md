# even-better-ls

![visual description of even-better-ls](http://imgur.com/H0sLGFX.png)

Driven by the success of my earlier project, [better-ls](https://github.com/illinoisjackson/better-ls/), which got a whopping 12 stars, I decided to work on a new, *better*, version.

better-ls was shitty. It worked by piping its output to the column command which formatted it, then finding and replacing filenames. It used Shell=True. ([explanation](https://stackoverflow.com/questions/3172470/actual-meaning-of-shell-true-in-subprocess)) It was a sparse implementation of ls as well.

It's more rational and safe to use GNU ls, not to mention its plethora of useful features. Even-better-ls is a simple modification of GNU coreutils ls combined with an arguably "hacky" but functional LS_COLORS environment variable.

# Installation

GNU coreutils ls is 4709 lines long. Pairing it with its includes rises the line count to around 11000. It's not logical to present 1/4 of the whole source of coreutils if there are only 2 lines changed in ls.c. For that reason, the way I suggest one builds even-better-ls is by downloading coreutils 8.2 and compiling it, and extracting the ls binary from the dark alley that is known as coreutils-8.2/src.

Side note: vdir and dir are also compiled during this process. Feel free to move them as well.

```wget http://ftp.gnu.org/gnu/coreutils/coreutils-8.2.tar.xz
tar -xf coreutils-8.2.tar.xz
cd coreutils-8.2/src
rm -rf ls.c
wget http://raw.githubusercontent.com/illinoisjackson/even-better-ls/master/ls.c
cd ..
./configure
make
cd src
mv ls /bin/ls # mv dir /bin/dir; mv vdir /bin/vdir
```

# Usage

The ls_colors_generator.py script allows you to customize the icons that are displayed in ls. You may want to chmod 777 it and place it in a binary directory so that you'll be able to include it in your shell init file.

In order to change the icons and colors displayed, you must edit the script. For now, I'm using @trapd00r 's LS_COLORS script, and @ryanoasis ' [nerd-fonts](http://www.github.com/ryanoasis/nerdfonts) for the icons. Emoji can be used but it is a much more sparse library than the full set of icons that nerd-fonts provides.

-- more coming soon --
