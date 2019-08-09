/*******************************************************************************

    D language bindings for libsodium's randombytes_internal_random.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.randombytes_internal_random;

@nogc nothrow:

import libsodium.export_;
import libsodium.randombytes;

extern (C):

extern __gshared randombytes_implementation randombytes_internal_implementation;
