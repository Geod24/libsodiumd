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
size_t crypto_generichash_bytes_min () @safe pure;

enum crypto_generichash_BYTES_MAX = crypto_generichash_blake2b_BYTES_MAX;
size_t crypto_generichash_bytes_max () @safe pure;

enum crypto_generichash_BYTES = crypto_generichash_blake2b_BYTES;
size_t crypto_generichash_bytes () @safe pure;

enum crypto_generichash_KEYBYTES_MIN = crypto_generichash_blake2b_KEYBYTES_MIN;
size_t crypto_generichash_keybytes_min () @safe pure;

enum crypto_generichash_KEYBYTES_MAX = crypto_generichash_blake2b_KEYBYTES_MAX;
size_t crypto_generichash_keybytes_max () @safe pure;

enum crypto_generichash_KEYBYTES = crypto_generichash_blake2b_KEYBYTES;
size_t crypto_generichash_keybytes () @safe pure;

enum crypto_generichash_PRIMITIVE = "blake2b";
const(char)* crypto_generichash_primitive () @safe pure;

/*
 * Important when writing bindings for other programming languages:
 * the state address should be 64-bytes aligned.
 */
alias crypto_generichash_state = crypto_generichash_blake2b_state;

size_t crypto_generichash_statebytes () @safe pure;

int crypto_generichash (
    scope ubyte* out_,
    size_t outlen,
    scope const(ubyte)* in_,
    ulong inlen,
    scope const(ubyte)* key,
    size_t keylen) pure;

/// @safe wrapper around `crypto_generichash`
extern(D) int crypto_generichash (
    scope ubyte[] out_,
    scope const ubyte[] in_,
    scope const ubyte[] key) @trusted pure
{
    return crypto_generichash(
        out_.ptr, out_.length,
        in_.ptr, in_.length,
        key.ptr, key.length);
}

int crypto_generichash_init (
    scope crypto_generichash_state* state,
    scope const(ubyte)* key,
    const size_t keylen,
    const size_t outlen) pure;

/// @safe wrapper around `crypto_generichash_init`
extern(D) int crypto_generichash_init (
    scope ref crypto_generichash_state state,
    scope const(ubyte)[] key,
    size_t outlen) @trusted pure
{
    return crypto_generichash_init(&state, key.ptr, key.length, outlen);
}

int crypto_generichash_update (
    scope crypto_generichash_state* state,
    scope const(ubyte)* in_,
    ulong inlen) pure;

/// @safe wrapper around `crypto_generichash_update`
extern(D) int crypto_generichash_update (
    scope ref crypto_generichash_state state,
    scope const(ubyte)[] in_) @trusted pure
{
    return crypto_generichash_update(&state, in_.ptr, in_.length);
}

int crypto_generichash_final (
    scope crypto_generichash_state* state,
    scope ubyte* out_,
    const size_t outlen) pure;

/// @safe wrapper around `crypto_generichash_final`
extern(D) int crypto_generichash_final (
    scope ref crypto_generichash_state state,
    scope ubyte[] out_) @trusted pure
{
    return crypto_generichash_final(&state, out_.ptr, out_.length);
}

void crypto_generichash_keygen (ref ubyte[crypto_generichash_KEYBYTES] k) @safe;
