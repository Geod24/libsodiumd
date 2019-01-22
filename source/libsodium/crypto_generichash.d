/*******************************************************************************

    D language bindings for libsodium's crypto_generichash.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_generichash;

@nogc nothrow:

import libsodium.export_;
import libsodium.crypto_generichash_blake2b;

extern (C):

enum crypto_generichash_BYTES_MIN = crypto_generichash_blake2b_BYTES_MIN;
size_t crypto_generichash_bytes_min ();

enum crypto_generichash_BYTES_MAX = crypto_generichash_blake2b_BYTES_MAX;
size_t crypto_generichash_bytes_max ();

enum crypto_generichash_BYTES = crypto_generichash_blake2b_BYTES;
size_t crypto_generichash_bytes ();

enum crypto_generichash_KEYBYTES_MIN = crypto_generichash_blake2b_KEYBYTES_MIN;
size_t crypto_generichash_keybytes_min ();

enum crypto_generichash_KEYBYTES_MAX = crypto_generichash_blake2b_KEYBYTES_MAX;
size_t crypto_generichash_keybytes_max ();

enum crypto_generichash_KEYBYTES = crypto_generichash_blake2b_KEYBYTES;
size_t crypto_generichash_keybytes ();

enum crypto_generichash_PRIMITIVE = "blake2b";
const(char)* crypto_generichash_primitive ();

/*
 * Important when writing bindings for other programming languages:
 * the state address should be 64-bytes aligned.
 */
alias crypto_generichash_state = crypto_generichash_blake2b_state;

size_t crypto_generichash_statebytes ();

int crypto_generichash (
    ubyte* out_,
    size_t outlen,
    const(ubyte)* in_,
    ulong inlen,
    const(ubyte)* key,
    size_t keylen);

int crypto_generichash_init (
    crypto_generichash_state* state,
    const(ubyte)* key,
    const size_t keylen,
    const size_t outlen);

int crypto_generichash_update (
    crypto_generichash_state* state,
    const(ubyte)* in_,
    ulong inlen);

int crypto_generichash_final (
    crypto_generichash_state* state,
    ubyte* out_,
    const size_t outlen);

void crypto_generichash_keygen (ref ubyte[crypto_generichash_KEYBYTES] k);
