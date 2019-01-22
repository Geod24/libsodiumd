/*******************************************************************************

    D language bindings for libsodium's crypto_aead_aes256gcm.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_aead_aes256gcm;

@nogc nothrow:

import libsodium.export_;

extern (C):

/*
 * WARNING: Despite being the most popular AEAD construction due to its
 * use in TLS, safely using AES-GCM in a different context is tricky.
 *
 * No more than ~ 350 GB of input data should be encrypted with a given key.
 * This is for ~ 16 KB messages -- Actual figures vary according to
 * message sizes.
 *
 * In addition, nonces are short and repeated nonces would totally destroy
 * the security of this scheme.
 *
 * Nonces should thus come from atomic counters, which can be difficult to
 * set up in a distributed environment.
 *
 * Unless you absolutely need AES-GCM, use crypto_aead_xchacha20poly1305_ietf_*()
 * instead. It doesn't have any of these limitations.
 * Or, if you don't need to authenticate additional data, just stick to
 * crypto_secretbox().
 */

int crypto_aead_aes256gcm_is_available ();

enum crypto_aead_aes256gcm_KEYBYTES = 32U;
size_t crypto_aead_aes256gcm_keybytes ();

enum crypto_aead_aes256gcm_NSECBYTES = 0U;
size_t crypto_aead_aes256gcm_nsecbytes ();

enum crypto_aead_aes256gcm_NPUBBYTES = 12U;
size_t crypto_aead_aes256gcm_npubbytes ();

enum crypto_aead_aes256gcm_ABYTES = 16U;
size_t crypto_aead_aes256gcm_abytes ();

enum crypto_aead_aes256gcm_MESSAGEBYTES_MAX =
    SODIUM_MIN(SODIUM_SIZE_MAX - crypto_aead_aes256gcm_ABYTES, 16UL * ((1UL << 32) - 2UL));
size_t crypto_aead_aes256gcm_messagebytes_max ();

struct crypto_aead_aes256gcm_state_
{
    ubyte[512] opaque;
}

alias crypto_aead_aes256gcm_state = crypto_aead_aes256gcm_state_;

size_t crypto_aead_aes256gcm_statebytes ();

int crypto_aead_aes256gcm_encrypt (
    ubyte* c,
    ulong* clen_p,
    const(ubyte)* m,
    ulong mlen,
    const(ubyte)* ad,
    ulong adlen,
    const(ubyte)* nsec,
    const(ubyte)* npub,
    const(ubyte)* k);

int crypto_aead_aes256gcm_decrypt (
    ubyte* m,
    ulong* mlen_p,
    ubyte* nsec,
    const(ubyte)* c,
    ulong clen,
    const(ubyte)* ad,
    ulong adlen,
    const(ubyte)* npub,
    const(ubyte)* k);

int crypto_aead_aes256gcm_encrypt_detached (
    ubyte* c,
    ubyte* mac,
    ulong* maclen_p,
    const(ubyte)* m,
    ulong mlen,
    const(ubyte)* ad,
    ulong adlen,
    const(ubyte)* nsec,
    const(ubyte)* npub,
    const(ubyte)* k);

int crypto_aead_aes256gcm_decrypt_detached (
    ubyte* m,
    ubyte* nsec,
    const(ubyte)* c,
    ulong clen,
    const(ubyte)* mac,
    const(ubyte)* ad,
    ulong adlen,
    const(ubyte)* npub,
    const(ubyte)* k);

/* -- Precomputation interface -- */

int crypto_aead_aes256gcm_beforenm (
    crypto_aead_aes256gcm_state* ctx_,
    const(ubyte)* k);

int crypto_aead_aes256gcm_encrypt_afternm (
    ubyte* c,
    ulong* clen_p,
    const(ubyte)* m,
    ulong mlen,
    const(ubyte)* ad,
    ulong adlen,
    const(ubyte)* nsec,
    const(ubyte)* npub,
    const(crypto_aead_aes256gcm_state)* ctx_);

int crypto_aead_aes256gcm_decrypt_afternm (
    ubyte* m,
    ulong* mlen_p,
    ubyte* nsec,
    const(ubyte)* c,
    ulong clen,
    const(ubyte)* ad,
    ulong adlen,
    const(ubyte)* npub,
    const(crypto_aead_aes256gcm_state)* ctx_);

int crypto_aead_aes256gcm_encrypt_detached_afternm (
    ubyte* c,
    ubyte* mac,
    ulong* maclen_p,
    const(ubyte)* m,
    ulong mlen,
    const(ubyte)* ad,
    ulong adlen,
    const(ubyte)* nsec,
    const(ubyte)* npub,
    const(crypto_aead_aes256gcm_state)* ctx_);

int crypto_aead_aes256gcm_decrypt_detached_afternm (
    ubyte* m,
    ubyte* nsec,
    const(ubyte)* c,
    ulong clen,
    const(ubyte)* mac,
    const(ubyte)* ad,
    ulong adlen,
    const(ubyte)* npub,
    const(crypto_aead_aes256gcm_state)* ctx_);

void crypto_aead_aes256gcm_keygen (ref ubyte[crypto_aead_aes256gcm_KEYBYTES] k);
