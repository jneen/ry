# ry: the simplest ruby virtual env

## Installation

If you're on a Mac with homebrew installed, you may simply `brew install ry` and follow the instructions.

Otherwise, install the files from the repo to your favorite prefix (I use `~/.local`, which is the default).

``` bash
git clone git://github.com/jneen/ry
cd ry
PREFIX=$HOME/.local make install
```

and add the following lines to your bashrc (or zshrc):

``` bash
# If you're using the default ~/.local prefix,
# make sure ~/.local/bin is on your $PATH.
export PATH="$HOME/.local/bin:$PATH"
eval "$(ry setup)"
```

or, if you don't like `eval`, you can do it manually:

``` bash
export PATH="$PREFIX/lib/ry/current/bin:$PATH"
```

For ZSH completion, see [this](https://github.com/jneen/ry/blob/master/share/ry.zsh_completion).

If you want to specify a different directory for installing rubies:

```bash
# rubies are installed into $RY_PREFIX/lib/ry/rubies
# set RY_RUBIES for an alternate location
export RY_RUBIES="$HOME/.rubies"
```

## Usage

Ry is a bit different from [other][rvm] [version][rbenv] [managers][nvm].  The major design goal of ry is to be explicit, unobtrusive, and easy to query.  In the vein of the [n][] package manager for node, there are no subshells, and the only thing it needs to add to your environment is a single entry to your `$PATH` (also tab completion if you like).  For example, here's how you create a new installation:

[rvm]: http://rvm.io/
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

### shell-local ruby selection

Because `ry use` changes a symlink, that ruby is globally activated across all shells.  To use a shell-local ruby, simply set your `$PATH` to include that ruby's bin dir.  The easiest way to do this is to use the `ry fullpath <ruby>` helper, which outputs a copy of your `$PATH` variable modified for use with ry.

``` bash
export PATH="$(ry fullpath my-cool-ruby)"
```

You can activate this automatically with something like [direnv](http://direnv.net/).

For more information, see `ry help`.

## Developing

All of the magic is in the bash script `bin/ry`.  Here are a couple of bash features I use that aren't common elsewhere:

* Poor man's namespacing - the character `:` is a perfectly valid character to use in a bash function's name.  All of ry's subcommands are implemented as functions looking like `ry::foo`.  At the bottom of the file is the function `ry` which essentially delegates to `ry::$1` - so to add a new subcommand, all you need to do is define the bash function and document it in `ry::usage`.

* Piping from heredocs is awesome.  The syntax `cmd <<<"$variable"` runs `cmd` with stdin as the content of `$variable`.  I use this extensively, and you should too.
