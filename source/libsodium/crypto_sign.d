/*******************************************************************************

    D language bindings for libsodium's crypto_sign.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_sign;

@nogc nothrow:

import libsodium.export_;
import libsodium.crypto_sign_ed25519;

extern (C):

/*
 * THREAD SAFETY: crypto_sign_keypair() is thread-safe,
 * provided that sodium_init() was called before.
 *
 * Other functions, including crypto_sign_seed_keypair() are always thread-safe.
 */

alias crypto_sign_state = crypto_sign_ed25519ph_state;

size_t crypto_sign_statebytes ();

enum crypto_sign_BYTES = crypto_sign_ed25519_BYTES;
size_t crypto_sign_bytes ();

enum crypto_sign_SEEDBYTES = crypto_sign_ed25519_SEEDBYTES;
size_t crypto_sign_seedbytes ();

enum crypto_sign_PUBLICKEYBYTES = crypto_sign_ed25519_PUBLICKEYBYTES;
size_t crypto_sign_publickeybytes ();

enum crypto_sign_SECRETKEYBYTES = crypto_sign_ed25519_SECRETKEYBYTES;
size_t crypto_sign_secretkeybytes ();

enum crypto_sign_MESSAGEBYTES_MAX = crypto_sign_ed25519_MESSAGEBYTES_MAX;
size_t crypto_sign_messagebytes_max ();

enum crypto_sign_PRIMITIVE = "ed25519";
const(char)* crypto_sign_primitive ();

int crypto_sign_seed_keypair (ubyte* pk, ubyte* sk, const(ubyte)* seed);

int crypto_sign_keypair (ubyte* pk, ubyte* sk);

int crypto_sign (
    ubyte* sm,
    ulong* smlen_p,
    const(ubyte)* m,
    ulong mlen,
    const(ubyte)* sk);

int crypto_sign_open (
    ubyte* m,
    ulong* mlen_p,
    const(ubyte)* sm,
    ulong smlen,
    const(ubyte)* pk);

int crypto_sign_detached (
    ubyte* sig,
    ulong* siglen_p,
    const(ubyte)* m,
    ulong mlen,
    const(ubyte)* sk);

int crypto_sign_verify_detached (
    const(ubyte)* sig,
    const(ubyte)* m,
    ulong mlen,
    const(ubyte)* pk);

int crypto_sign_init (crypto_sign_state* state);

int crypto_sign_update (crypto_sign_state* state, const(ubyte)* m, ulong mlen);

int crypto_sign_final_create (
    crypto_sign_state* state,
    ubyte* sig,
    ulong* siglen_p,
    const(ubyte)* sk);

int crypto_sign_final_verify (
    crypto_sign_state* state,
    const(ubyte)* sig,
    const(ubyte)* pk);
