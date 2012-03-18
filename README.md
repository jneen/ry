# ry: the simplest ruby virtual env

## Installation

Install the files

``` bash
git clone git://github.com/jayferd/ry
cd ry
PREFIX=$HOME/.local make install
```

and add the following lines to your bashrc:

``` bash
export PATH="$HOME/.local/bin:$PATH"
eval "$(ry setup)"
```

or, if you don't like `eval`, you can do it manually:

``` bash
export RY_PREFIX="$HOME/.local"
export PATH="$RY_PREFIX/lib/ry/current/bin:$PATH"
. "$RY_PREFIX/lib/ry.bash_completion"
```

## Usage

Ry is a bit different from [other][rvm] [version][rbenv] [managers][nvm].  The major design goal of ry is to be explicit, unobtrusive, and easy to query.  In the vein of the [n][] package manager for node, there are no subshells, and the only thing it needs to add to your environment is a single entry to your `$PATH` (also tab completion if you like).  For example, here's how you create a new installation:

[rvm]: http://rvm.beginrescueend.com/
[nvm]: https://github.com/creationix/nvm
[rbenv]: https://github.com/sstephenson/rbenv
[n]: https://github.com/visionmedia/n

``` bash
ry install http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p125.tar.gz mri-1.9.3
```

This creates an installation of Ruby called `mri-1.9.3` using the tarball from `ruby-lang.org`.  To switch to this ruby, use

``` bash
ry use mri-1.9.3 # or: ry mri-1.9.3
```

Want to use a custom commit?

``` bash
ry install https://github.com/ruby/ruby/tarball/<hash> mri-custom
```

### ruby-build
If you have `ruby-build` installed, you can use it very easily with ry:

``` bash
ry install 1.9.3-p125
```

For more information, see `ry help`.
