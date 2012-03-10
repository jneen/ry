# ry: the simplest version manager for Ruby

## Installation

Install the files

``` bash
git clone git://github.com/jayferd/ry
cd ry
PREFIX=$HOME/.local make install
```

and add the following to your bashrc:

``` bash
eval "$(ry setup)"
```

or, if you don't like `eval`, you can do it manually:

``` bash
export R_PREFIX="$HOME/.local"
export PATH="$R_PREFIX/lib/ry/current/bin:$PATH"
. "$R_PREFIX/lib/ry.bash_completion"
```
