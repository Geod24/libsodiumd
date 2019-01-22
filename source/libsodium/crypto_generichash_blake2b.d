/*******************************************************************************

    D language bindings for libsodium's crypto_generichash_blake2b.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_generichash_blake2b;

@nogc nothrow:

import libsodium.export_;

extern (C):

struct crypto_generichash_blake2b_state
{
    ubyte[384] opaque;
}

enum crypto_generichash_blake2b_BYTES_MIN = 16U;
size_t crypto_generichash_blake2b_bytes_min ();

enum crypto_generichash_blake2b_BYTES_MAX = 64U;
size_t crypto_generichash_blake2b_bytes_max ();

enum crypto_generichash_blake2b_BYTES = 32U;
size_t crypto_generichash_blake2b_bytes ();

enum crypto_generichash_blake2b_KEYBYTES_MIN = 16U;
size_t crypto_generichash_blake2b_keybytes_min ();

enum crypto_generichash_blake2b_KEYBYTES_MAX = 64U;
size_t crypto_generichash_blake2b_keybytes_max ();

enum crypto_generichash_blake2b_KEYBYTES = 32U;
size_t crypto_generichash_blake2b_keybytes ();

enum crypto_generichash_blake2b_SALTBYTES = 16U;
size_t crypto_generichash_blake2b_saltbytes ();

enum crypto_generichash_blake2b_PERSONALBYTES = 16U;
size_t crypto_generichash_blake2b_personalbytes ();

size_t crypto_generichash_blake2b_statebytes ();

int crypto_generichash_blake2b (
    ubyte* out_,
    size_t outlen,
    const(ubyte)* in_,
    ulong inlen,
    const(ubyte)* key,
    size_t keylen);

int crypto_generichash_blake2b_salt_personal (
    ubyte* out_,
    size_t outlen,
    const(ubyte)* in_,
    ulong inlen,
    const(ubyte)* key,
    size_t keylen,
    const(ubyte)* salt,
    const(ubyte)* personal);

int crypto_generichash_blake2b_init (
    crypto_generichash_blake2b_state* state,
    const(ubyte)* key,
    const size_t keylen,
    const size_t outlen);

int crypto_generichash_blake2b_init_salt_personal (
    crypto_generichash_blake2b_state* state,
    const(ubyte)* key,
    const size_t keylen,
    const size_t outlen,
    const(ubyte)* salt,
    const(ubyte)* personal);

int crypto_generichash_blake2b_update (
    crypto_generichash_blake2b_state* state,
    const(ubyte)* in_,
    ulong inlen);

int crypto_generichash_blake2b_final (
    crypto_generichash_blake2b_state* state,
    ubyte* out_,
    const size_t outlen);

void crypto_generichash_blake2b_keygen (
    ref ubyte[crypto_generichash_blake2b_KEYBYTES] k);
