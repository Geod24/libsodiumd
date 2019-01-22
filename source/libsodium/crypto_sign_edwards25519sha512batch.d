/*******************************************************************************

    D language bindings for libsodium's crypto_sign_edwards25519sha512batch.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_sign_edwards25519sha512batch;

@nogc nothrow:

import libsodium.export_;

extern (C):

/*
 * WARNING: This construction was a prototype, which should not be used
 * any more in new projects.
 *
 * crypto_sign_edwards25519sha512batch is provided for applications
 * initially built with NaCl, but as recommended by the author of this
 * construction, new applications should use ed25519 instead.
 *
 * In Sodium, you should use the high-level crypto_sign_*() functions instead.
 */

enum crypto_sign_edwards25519sha512batch_BYTES = 64U;
enum crypto_sign_edwards25519sha512batch_PUBLICKEYBYTES = 32U;
enum crypto_sign_edwards25519sha512batch_SECRETKEYBYTES = 32U + 32U;
enum crypto_sign_edwards25519sha512batch_MESSAGEBYTES_MAX = SODIUM_SIZE_MAX - crypto_sign_edwards25519sha512batch_BYTES;

int crypto_sign_edwards25519sha512batch (
    ubyte* sm,
    ulong* smlen_p,
    const(ubyte)* m,
    ulong mlen,
    const(ubyte)* sk);

int crypto_sign_edwards25519sha512batch_open (
    ubyte* m,
    ulong* mlen_p,
    const(ubyte)* sm,
    ulong smlen,
    const(ubyte)* pk);

int crypto_sign_edwards25519sha512batch_keypair (ubyte* pk, ubyte* sk);
