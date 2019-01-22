/*******************************************************************************

    D language bindings for libsodium's crypto_stream_chacha20.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_stream_chacha20;

@nogc nothrow:

import libsodium.export_;

extern (C):

/*
 *  WARNING: This is just a stream cipher. It is NOT authenticated encryption.
 *  While it provides some protection against eavesdropping, it does NOT
 *  provide any security against active attacks.
 *  Unless you know what you're doing, what you are looking for is probably
 *  the crypto_box functions.
 */

enum crypto_stream_chacha20_KEYBYTES = 32U;
size_t crypto_stream_chacha20_keybytes ();

enum crypto_stream_chacha20_NONCEBYTES = 8U;
size_t crypto_stream_chacha20_noncebytes ();

enum crypto_stream_chacha20_MESSAGEBYTES_MAX = SODIUM_SIZE_MAX;
size_t crypto_stream_chacha20_messagebytes_max ();

/* ChaCha20 with a 64-bit nonce and a 64-bit counter, as originally designed */

int crypto_stream_chacha20 (
    ubyte* c,
    ulong clen,
    const(ubyte)* n,
    const(ubyte)* k);

int crypto_stream_chacha20_xor (
    ubyte* c,
    const(ubyte)* m,
    ulong mlen,
    const(ubyte)* n,
    const(ubyte)* k);

int crypto_stream_chacha20_xor_ic (
    ubyte* c,
    const(ubyte)* m,
    ulong mlen,
    const(ubyte)* n,
    ulong ic,
    const(ubyte)* k);

void crypto_stream_chacha20_keygen (
    ref ubyte[crypto_stream_chacha20_KEYBYTES] k);

/* ChaCha20 with a 96-bit nonce and a 32-bit counter (IETF) */

enum crypto_stream_chacha20_ietf_KEYBYTES = 32U;
size_t crypto_stream_chacha20_ietf_keybytes ();

enum crypto_stream_chacha20_ietf_NONCEBYTES = 12U;
size_t crypto_stream_chacha20_ietf_noncebytes ();

enum crypto_stream_chacha20_ietf_MESSAGEBYTES_MAX = SODIUM_MIN(SODIUM_SIZE_MAX, 64UL * (1UL << 32));
size_t crypto_stream_chacha20_ietf_messagebytes_max ();

int crypto_stream_chacha20_ietf (
    ubyte* c,
    ulong clen,
    const(ubyte)* n,
    const(ubyte)* k);

int crypto_stream_chacha20_ietf_xor (
    ubyte* c,
    const(ubyte)* m,
    ulong mlen,
    const(ubyte)* n,
    const(ubyte)* k);

int crypto_stream_chacha20_ietf_xor_ic (
    ubyte* c,
    const(ubyte)* m,
    ulong mlen,
    const(ubyte)* n,
    uint ic,
    const(ubyte)* k);

void crypto_stream_chacha20_ietf_keygen (
    ref ubyte[crypto_stream_chacha20_ietf_KEYBYTES] k);

/* Aliases */

enum crypto_stream_chacha20_IETF_KEYBYTES = crypto_stream_chacha20_ietf_KEYBYTES;
enum crypto_stream_chacha20_IETF_NONCEBYTES = crypto_stream_chacha20_ietf_NONCEBYTES;
enum crypto_stream_chacha20_IETF_MESSAGEBYTES_MAX = crypto_stream_chacha20_ietf_MESSAGEBYTES_MAX;
