bindings-lxc
============

[![Hackage package](http://img.shields.io/hackage/v/bindings-lxc.svg)](http://hackage.haskell.org/package/bindings-lxc)
[![Build Status](https://travis-ci.org/fizruk/bindings-lxc.svg?branch=master)](https://travis-ci.org/fizruk/bindings-lxc)

Direct Haskell bindings to LXC (Linux containers) C API.

The package provides direct bindings to LXC C API through @bindings-dsl@.

For high-level Haskell LXC API see [lxc package](http://hackage.haskell.org/package/lxc).

## Requirements

Before installation make sure you have LXC installed on your system with header files and static library.

On Ubuntu 14.04 LTS (Trusty Tahr):

```
$ sudo apt-get install lxc-dev
```

On previous Ubuntu versions (including 12.04 LTS Precise Pangolin) standard repositories do not contain `liblxc1` package.
You might want to use `ppa:ubuntu-lxc/stable` repository instead:

```
$ sudo apt-get install software-properties-common python-software-properties
$ sudo add-apt-repository ppa:ubuntu-lxc/stable
$ sudo apt-get update
$ sudo apt-get install lxc-dev
```

## Installation

Get the latest stable version from Hackage:

```
$ cabal install bindings-lxc
```

or clone this repository:

```
$ git clone https://github.com/fizruk/bindings-lxc.git
$ cd bindings-lxc
$ cabal install
```

## Documentation

Haddock documentation is available at http://fizruk.github.io/bindings-lxc/docs/

## Contributing

Contributions and bug reports are welcome!

Please feel free to contact me via GitHub or on the #haskell IRC channel on irc.freenode.net.

-Nickolay Kudasov
