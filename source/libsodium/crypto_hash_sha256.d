/*******************************************************************************

    D language bindings for libsodium's crypto_hash_sha256.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_hash_sha256;

@nogc nothrow:

import libsodium.export_;

extern (C):

/*
 * WARNING: Unless you absolutely need to use SHA256 for interoperatibility,
 * purposes, you might want to consider crypto_generichash() instead.
 * Unlike SHA256, crypto_generichash() is not vulnerable to length
 * extension attacks.
 */

struct crypto_hash_sha256_state
{
    uint[8] state;
    ulong count;
    ubyte[64] buf;
}

size_t crypto_hash_sha256_statebytes ();

enum crypto_hash_sha256_BYTES = 32U;
size_t crypto_hash_sha256_bytes ();

int crypto_hash_sha256 (ubyte* out_, const(ubyte)* in_, ulong inlen);

int crypto_hash_sha256_init (crypto_hash_sha256_state* state);

int crypto_hash_sha256_update (
    crypto_hash_sha256_state* state,
    const(ubyte)* in_,
    ulong inlen);

int crypto_hash_sha256_final (crypto_hash_sha256_state* state, ubyte* out_);
