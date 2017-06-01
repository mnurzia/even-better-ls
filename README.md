# even-better-ls

![visual description of even-better-ls](http://imgur.com/H0sLGFX.png)

## Features

- Almost full stock extension set
- 256 color pallette (expandable)
- Support for a wide variety of characters from nerd-fonts

Driven by the success of my earlier project, [better-ls](https://github.com/illinoisjackson/better-ls/), which got a whopping 12 stars, I decided to work on a new, *better*, version.

better-ls was shitty. It worked by piping its output to the column command which formatted it, then finding and replacing filenames. It used Shell=True. ([explanation](https://stackoverflow.com/questions/3172470/actual-meaning-of-shell-true-in-subprocess)) It was a sparse implementation of ls as well.

It's more rational and safe to use GNU ls, not to mention its plethora of useful features. Even-better-ls is a simple modification of GNU coreutils ls combined with an arguably "hacky" but functional LS_COLORS environment variable.

# Installation

GNU coreutils ls is 4709 lines long. Pairing it with its includes rises the line count to around 11000. It's not logical to present 1/4 of the whole source of coreutils if there are only 2 lines changed in ls.c. For that reason, the way I suggest one builds even-better-ls is by downloading coreutils 8.2 and compiling it, and extracting the ls binary from the dark alley that is known as coreutils-8.2/src.

Side note: vdir and dir are also compiled during this process. Feel free to move them as well.

[This may be downloaded as a shell script as well.](https://github.com/illinoisjackson/even-better-ls/blob/master/install.sh)

```
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
```

Additionally, one should add this to their ~/.bashrc or ~/.zsh_profile or whatever:

```
LS_COLORS=$(python /path/to/ls_colors_generator.py)
alias ls="ls-i --color=auto -w $(tput cols)"
alias dir="dir-i --color=auto -w $(tput cols)"
alias vdir="vdir-i --color=auto -w $(tput cols)"
```

# Usage

The ls_colors_generator.py script allows you to customize the icons that are displayed in ls. You may want to chmod 777 it and place it in a binary directory so that you'll be able to include it in your shell init file.

In order to change the icons and colors displayed, you must edit the script. For now, I'm using trapd00r 's [LS_COLORS script](https://github.com/trapd00r/LS_COLORS), and @ryanoasis ' [nerd-fonts](http://www.github.com/ryanoasis/nerd-fonts) and [devicons-shell](http://www.github.com/ryanoasis/devicons-shell) for the icons. Emoji can be used but it is a much more sparse library than the full set of icons that nerd-fonts provides

In ls_colors_generator.py extension colors and characters correspond to their appropriate extension in the EXTENSIONS dict in the get_colors() function. For example, this line:

```".err":		cc(160, 16, 0xF12A, other="1"),```

associates the extension ".err" with the foreground color 160 and the background color 16. It sets its character to the Unicode codepoint located at 0xF12A, which in this case is the font awesome exclamation point. It also sets a special attribute of the displayed character and text, which is defined in the "other" argument. In this case, it means that the text shall be displayed as bold.

The default extension set should suffice for most people. This does not, however, mean that development of new extension sets should cease. More extensions = better. Please feel free to commit new extensions definitions. Emoji support should be added soon.
