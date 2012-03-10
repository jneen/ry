# ry: the simplest ruby virtual env

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
export RY_PREFIX="$HOME/.local"
export PATH="$RY_PREFIX/lib/ry/current/bin:$PATH"
. "$RY_PREFIX/lib/ry.bash_completion"
```

## Usage

Ry is a bit different from [other][rvm] [version][rbenv] [managers][nvm].  The major design goal of ry is to be explicit, unobtrusive, and easy to query.  In the vein of the [n][] package manager for node, there are no subshells, and the only thing it needs to add to your environment is a single entry to your `$PATH` (also tab completion if you like).  For example, here's how you create a new installation:

[rvm]: http://rvm.beginrescueend.com/
[rbenv]: https://github.com/sstephenson/rbenv
[n]: https://github.com/visionmedia/n

``` bash
ry install mri-1.9.3 http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p125.tar.gz
```

This creates an installation of Ruby called `mri-1.9.3` using the tarball from `ruby-lang.org`.  To switch to this ruby, use

``` bash
ry use mri-1.9.3 # or: ry mri-1.9.3
```

Want to use the latest HEAD?

``` bash
ry install mri-head https://github.com/ruby/ruby/tarball/HEAD
```

Or a custom commit?

``` bash
ry install mri-custom https://github.com/ruby/ruby/tarball/<hash>
```

It will also build Rubinius:

``` bash
ry install rbx https://github.com/rubinius/rubinius/tarball/v1.2.4
```
