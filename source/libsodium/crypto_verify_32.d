/*******************************************************************************

    D language bindings for libsodium's crypto_verify_32.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_verify_32;

@nogc nothrow:

import libsodium.export_;

extern (C):

enum crypto_verify_32_BYTES = 32U;
size_t crypto_verify_32_bytes ();

int crypto_verify_32 (const(ubyte)* x, const(ubyte)* y);
