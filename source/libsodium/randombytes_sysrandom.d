/*******************************************************************************

    D language bindings for libsodium's randombytes_sysrandom.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.randombytes_sysrandom;

@nogc nothrow:

import libsodium.export_;
import libsodium.randombytes;

extern (C):

extern __gshared randombytes_implementation randombytes_sysrandom_implementation;
