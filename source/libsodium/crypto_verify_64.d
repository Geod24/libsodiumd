/*******************************************************************************

    D language bindings for libsodium's crypto_verify_64.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_verify_64;

@nogc nothrow:

import libsodium.export_;

extern (C):

enum crypto_verify_64_BYTES = 64U;
size_t crypto_verify_64_bytes ();

int crypto_verify_64 (const(ubyte)* x, const(ubyte)* y);
