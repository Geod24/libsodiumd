/*******************************************************************************

    D language bindings for libsodium's crypto_hash_sha512.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_hash_sha512;

@nogc nothrow:

import libsodium.export_;

extern (C):

/*
 * WARNING: Unless you absolutely need to use SHA512 for interoperatibility,
 * purposes, you might want to consider crypto_generichash() instead.
 * Unlike SHA512, crypto_generichash() is not vulnerable to length
 * extension attacks.
 */

struct crypto_hash_sha512_state
{
    ulong[8] state;
    ulong[2] count;
    ubyte[128] buf;
}

size_t crypto_hash_sha512_statebytes ();

enum crypto_hash_sha512_BYTES = 64U;
size_t crypto_hash_sha512_bytes ();

int crypto_hash_sha512 (ubyte* out_, const(ubyte)* in_, ulong inlen);

int crypto_hash_sha512_init (crypto_hash_sha512_state* state);

int crypto_hash_sha512_update (
    crypto_hash_sha512_state* state,
    const(ubyte)* in_,
    ulong inlen);

int crypto_hash_sha512_final (crypto_hash_sha512_state* state, ubyte* out_);
