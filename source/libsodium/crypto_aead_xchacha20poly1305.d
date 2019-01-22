/*******************************************************************************

    D language bindings for libsodium's crypto_aead_xchacha20poly1305.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_aead_xchacha20poly1305;

@nogc nothrow:

import libsodium.export_;

extern (C):

enum crypto_aead_xchacha20poly1305_ietf_KEYBYTES = 32U;
size_t crypto_aead_xchacha20poly1305_ietf_keybytes ();

enum crypto_aead_xchacha20poly1305_ietf_NSECBYTES = 0U;
size_t crypto_aead_xchacha20poly1305_ietf_nsecbytes ();

enum crypto_aead_xchacha20poly1305_ietf_NPUBBYTES = 24U;
size_t crypto_aead_xchacha20poly1305_ietf_npubbytes ();

enum crypto_aead_xchacha20poly1305_ietf_ABYTES = 16U;
size_t crypto_aead_xchacha20poly1305_ietf_abytes ();

enum crypto_aead_xchacha20poly1305_ietf_MESSAGEBYTES_MAX = SODIUM_SIZE_MAX - crypto_aead_xchacha20poly1305_ietf_ABYTES;
size_t crypto_aead_xchacha20poly1305_ietf_messagebytes_max ();

int crypto_aead_xchacha20poly1305_ietf_encrypt (
    ubyte* c,
    ulong* clen_p,
    const(ubyte)* m,
    ulong mlen,
    const(ubyte)* ad,
    ulong adlen,
    const(ubyte)* nsec,
    const(ubyte)* npub,
    const(ubyte)* k);

int crypto_aead_xchacha20poly1305_ietf_decrypt (
    ubyte* m,
    ulong* mlen_p,
    ubyte* nsec,
    const(ubyte)* c,
    ulong clen,
    const(ubyte)* ad,
    ulong adlen,
    const(ubyte)* npub,
    const(ubyte)* k);

int crypto_aead_xchacha20poly1305_ietf_encrypt_detached (
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

int crypto_aead_xchacha20poly1305_ietf_decrypt_detached (
    ubyte* m,
    ubyte* nsec,
    const(ubyte)* c,
    ulong clen,
    const(ubyte)* mac,
    const(ubyte)* ad,
    ulong adlen,
    const(ubyte)* npub,
    const(ubyte)* k);

void crypto_aead_xchacha20poly1305_ietf_keygen (
    ref ubyte[crypto_aead_xchacha20poly1305_ietf_KEYBYTES] k);

/* Aliases */

enum crypto_aead_xchacha20poly1305_IETF_KEYBYTES = crypto_aead_xchacha20poly1305_ietf_KEYBYTES;
enum crypto_aead_xchacha20poly1305_IETF_NSECBYTES = crypto_aead_xchacha20poly1305_ietf_NSECBYTES;
enum crypto_aead_xchacha20poly1305_IETF_NPUBBYTES = crypto_aead_xchacha20poly1305_ietf_NPUBBYTES;
enum crypto_aead_xchacha20poly1305_IETF_ABYTES = crypto_aead_xchacha20poly1305_ietf_ABYTES;
enum crypto_aead_xchacha20poly1305_IETF_MESSAGEBYTES_MAX = crypto_aead_xchacha20poly1305_ietf_MESSAGEBYTES_MAX;
