/*******************************************************************************

    D language bindings for libsodium's crypto_sign_ed25519.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_sign_ed25519;

@nogc nothrow:

import libsodium.export_;
import libsodium.crypto_hash_sha512;

extern (C):

struct crypto_sign_ed25519ph_state
{
    crypto_hash_sha512_state hs;
}

size_t crypto_sign_ed25519ph_statebytes ();

enum crypto_sign_ed25519_BYTES = 64U;
size_t crypto_sign_ed25519_bytes ();

enum crypto_sign_ed25519_SEEDBYTES = 32U;
size_t crypto_sign_ed25519_seedbytes ();

enum crypto_sign_ed25519_PUBLICKEYBYTES = 32U;
size_t crypto_sign_ed25519_publickeybytes ();

enum crypto_sign_ed25519_SECRETKEYBYTES = 32U + 32U;
size_t crypto_sign_ed25519_secretkeybytes ();

enum crypto_sign_ed25519_MESSAGEBYTES_MAX = SODIUM_SIZE_MAX - crypto_sign_ed25519_BYTES;
size_t crypto_sign_ed25519_messagebytes_max ();

int crypto_sign_ed25519 (
    ubyte* sm,
    ulong* smlen_p,
    const(ubyte)* m,
    ulong mlen,
    const(ubyte)* sk);

int crypto_sign_ed25519_open (
    ubyte* m,
    ulong* mlen_p,
    const(ubyte)* sm,
    ulong smlen,
    const(ubyte)* pk);

int crypto_sign_ed25519_detached (
    ubyte* sig,
    ulong* siglen_p,
    const(ubyte)* m,
    ulong mlen,
    const(ubyte)* sk);

int crypto_sign_ed25519_verify_detached (
    const(ubyte)* sig,
    const(ubyte)* m,
    ulong mlen,
    const(ubyte)* pk);

int crypto_sign_ed25519_keypair (ubyte* pk, ubyte* sk);

int crypto_sign_ed25519_seed_keypair (ubyte* pk, ubyte* sk, const(ubyte)* seed);

int crypto_sign_ed25519_pk_to_curve25519 (
    ubyte* curve25519_pk,
    const(ubyte)* ed25519_pk);

int crypto_sign_ed25519_sk_to_curve25519 (
    ubyte* curve25519_sk,
    const(ubyte)* ed25519_sk);

int crypto_sign_ed25519_sk_to_seed (ubyte* seed, const(ubyte)* sk);

int crypto_sign_ed25519_sk_to_pk (ubyte* pk, const(ubyte)* sk);

int crypto_sign_ed25519ph_init (crypto_sign_ed25519ph_state* state);

int crypto_sign_ed25519ph_update (
    crypto_sign_ed25519ph_state* state,
    const(ubyte)* m,
    ulong mlen);

int crypto_sign_ed25519ph_final_create (
    crypto_sign_ed25519ph_state* state,
    ubyte* sig,
    ulong* siglen_p,
    const(ubyte)* sk);

int crypto_sign_ed25519ph_final_verify (
    crypto_sign_ed25519ph_state* state,
    const(ubyte)* sig,
    const(ubyte)* pk);
