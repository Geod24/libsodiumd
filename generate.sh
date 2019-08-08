#!/usr/bin/env sh

set -e

if [ "$#" -eq 4 ]
then
    echo "Wrong arguments number"
    echo "Usage: $0 DSTEP_BINARY LIPSODIUM_REPO LIBSODIUMD_PACKAGE"
    exit 1
fi

DSTEP=$1
SRCDIR=$2
export LIBSODIUMD=$3/source/libsodium/

# Remove all previous files
rm -rf ${LIBSODIUMD}/*.d

# Generate D files from C headers
#
# Details:
#   it ignores typedefs vs. structs collisions
#   disabled randombytes_salsa20_implementation - this backward compatibility symbol causes wrong codegen
find "$SRCDIR/src/libsodium/include/sodium" -maxdepth 1 -xtype f -name '*.h' \
    -exec ${DSTEP} --collision-action=ignore --skip randombytes_salsa20_implementation '{}' \; \
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

import libsodium;
" | cat - $file > $file.tmp && mv $file.tmp $file
done

# Generate root package file
echo "/// D language bindings for libsodium\n///\n/// License: ISC (see LICENSE.txt)\nmodule libsodium;\n" >> ${LIBSODIUMD}/package.d
grep -r 'module ' --no-filename --include='*.d' ${LIBSODIUMD} | sed 's/module/public import/' | sort >> ${LIBSODIUMD}/package.d
