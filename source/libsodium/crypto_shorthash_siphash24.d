/*******************************************************************************

    D language bindings for libsodium's crypto_shorthash_siphash24.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_shorthash_siphash24;

@nogc nothrow:

import libsodium.export_;

extern (C):

/* -- 64-bit output -- */

enum crypto_shorthash_siphash24_BYTES = 8U;
size_t crypto_shorthash_siphash24_bytes ();

enum crypto_shorthash_siphash24_KEYBYTES = 16U;
size_t crypto_shorthash_siphash24_keybytes ();

int crypto_shorthash_siphash24 (
    ubyte* out_,
    const(ubyte)* in_,
    ulong inlen,
    const(ubyte)* k);

/* -- 128-bit output -- */

enum crypto_shorthash_siphashx24_BYTES = 16U;
size_t crypto_shorthash_siphashx24_bytes ();

enum crypto_shorthash_siphashx24_KEYBYTES = 16U;
size_t crypto_shorthash_siphashx24_keybytes ();

int crypto_shorthash_siphashx24 (
    ubyte* out_,
    const(ubyte)* in_,
    ulong inlen,
    const(ubyte)* k);
