## Libsodiumd: D bindings for libsodium

[![Build Status](https://travis-ci.com/geod24/libsodiumd.svg?branch=upstream-1.0.17)](https://travis-ci.com/geod24/libsodiumd)
[![DUB Package](https://img.shields.io/dub/v/libsodiumd.svg)](https://code.dlang.org/packages/libsodiumd)

Currently supported version: v1.0.18 (released 2019-05-31)

Those bindings are simple translation from C to D.
They are simple, stupid, unnanotated - minimal modification has been applied
to make sure any new release does not lead to excessive work.

## Usage / Documentation

This wrapper provide a `package` file, just like `#include "sodium.h"`.
Just `import libsodium;` to get all available symbols.

Some unittests are available in said package file.
For a more comprehensive documentation, refer directly to [libsodium's doc](https://libsodium.gitbook.io/doc/).

## Binding generation

The bindings were generated with the following procedure:
- Install [dstep](https://github.com/jacob-carlborg/dstep).
- Clone the [official repository](https://github.com/jedisct1/libsodium/).
- Checkout the required version
- Translate C headers to D modules:
```sh
./generate.sh $DSTEP $LIPSODIUM_REPO $LIBSODIUMD_PACKAGE
```
  With `$DSTEP`, `$LIPSODIUM_REPO` and `$LIBSODIUMD_PACKAGE` being the dstep binary and path to git repositories, respectively.
