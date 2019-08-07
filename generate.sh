#!/usr/bin/env sh

set -ex

DSTEP=$1
SRCDIR=$2
LIBSODIUMD=$3/source/libsodium/
export LIBSODIUMD

# Generate D files from C headers
find "$SRCDIR/src/libsodium/include" -maxdepth 2 -xtype f -name '*.h' \
    -exec ${DSTEP} '{}' \; \
    -exec sh -c 'mv $(dirname "$0")/*.d ${LIBSODIUMD}' {}  \;

mv ${LIBSODIUMD}/export.d ${LIBSODIUMD}/export_.d # as it conflicts with a D keyword

# Adding module documentation, module name, and standard import
for file in $(find ${LIBSODIUMD} -xtype f -name "*.d")
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

# Turn ULL constants into UL:
for file in $(find ${LIBSODIUMD} -xtype f -name "*.d")
do
sed -i -e 's/\([[:digit:]]\)ULL/\1UL/g' $file
done

# Generate sodium.d
