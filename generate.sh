#!/usr/bin/env sh

set -e

DSTEP=$1
SRCDIR=$2
LIBSODIUMD=$3/source/libsodium
export LIBSODIUMD

# Remove all previous files
rm -rf ${LIBSODIUMD}/*

# Generate D files from C headers
find "$SRCDIR/src/libsodium/include/sodium" -maxdepth 1 -xtype f -name '*.h' \
    -exec ${DSTEP} '{}' \; \
    -exec sh -c 'mv $(dirname "$0")/*.d ${LIBSODIUMD}' {}  \;

mv ${LIBSODIUMD}/export.d ${LIBSODIUMD}/export_.d # as it conflicts with a D keyword

# Turn ULL constants into UL:
for file in $(find ${LIBSODIUMD} -xtype f -name "*.d")
do
sed -i -e 's/\([[:digit:]]\)ULL/\1UL/g' $file
done

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

# Generate root package file
echo "/// D language bindings for libsodium\n///\n/// License: ISC (see LICENSE.txt)\nmodule libsodium;\n" >> ${LIBSODIUMD}/package.d
grep -re 'module ' --no-filename --include='*.d' ${LIBSODIUMD} | sed 's/module/public import/' | grep -v '#public import libsodium.sodium;' | sort >> ${LIBSODIUMD}/package.d
