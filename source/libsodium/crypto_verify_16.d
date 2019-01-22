/*******************************************************************************

    D language bindings for libsodium's crypto_verify_16.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_verify_16;

@nogc nothrow:

import libsodium.export_;

extern (C):

enum crypto_verify_16_BYTES = 16U;
size_t crypto_verify_16_bytes ();

int crypto_verify_16 (const(ubyte)* x, const(ubyte)* y);
