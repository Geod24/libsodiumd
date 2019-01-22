/*******************************************************************************

    D language bindings for libsodium's randombytes_salsa20_random.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.randombytes_salsa20_random;

@nogc nothrow:

import libsodium.export_;
import libsodium.randombytes;

extern (C):

extern __gshared randombytes_implementation randombytes_salsa20_implementation;
