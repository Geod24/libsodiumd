## Libsodiumd: D bindings for libsodium

Currently supported version: v1.0.17 (released 2019-01-07)

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
find src/libsodium/include/sodium -depth 1 -name "*.h" | xargs -I F $DSTEP -Isrc/libsodium/include/sodium/ F -o $LIBSODIUMD/source/libsodium/$(basename F | cut -d'.' -f1).d
```
  With `$DSTEP` and `$LIBSODIUMD` being the dstep binary and path to this git repository, respectively.

Then, a few manual adjustment were made:
- `mv source/libsodium/export.d source/libsodium/export_.d` as it conflicts with a D keyword
- Module documentation, module name, and standard import were added:
```sh
for file in $(find source/libsodium -name "*.d")
do
echo "\
/*******************************************************************************

    D language bindings for libsodium's $(basename $file | cut -d'.' -f1).h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.$(basename $file | cut -d'.' -f1);

@nogc nothrow:

import libsodium.export_;
" | cat - $file > $file.tmp && mv $file.tmp $file
done
```
- Turn `ULL` constants into `UL`:
```sh
for file in $(find source/libsodium -name "*.d")
do
sed -i '' -e 's/([[:digit:]])ULL/\1UL/g' $file
done
```

- Try to compile, add missing imports and fix `dstep` mishaps (e.g. some extra `_` are added)
- Generate `source/libsodium/package_.d`
