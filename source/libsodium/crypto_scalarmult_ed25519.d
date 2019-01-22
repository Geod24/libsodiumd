/*******************************************************************************

    D language bindings for libsodium's crypto_scalarmult_ed25519.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_scalarmult_ed25519;

@nogc nothrow:

import libsodium.export_;

extern (C):

enum crypto_scalarmult_ed25519_BYTES = 32U;
size_t crypto_scalarmult_ed25519_bytes ();

enum crypto_scalarmult_ed25519_SCALARBYTES = 32U;
size_t crypto_scalarmult_ed25519_scalarbytes ();

/*
 * NOTE: Do not use the result of this function directly.
 *
 * Hash the result with the public keys in order to compute a shared
 * secret key: H(q || client_pk || server_pk)
 *
 * Or unless this is not an option, use the crypto_kx() API instead.
 */
int crypto_scalarmult_ed25519 (ubyte* q, const(ubyte)* n, const(ubyte)* p);

int crypto_scalarmult_ed25519_noclamp (
    ubyte* q,
    const(ubyte)* n,
    const(ubyte)* p);

int crypto_scalarmult_ed25519_base (ubyte* q, const(ubyte)* n);

int crypto_scalarmult_ed25519_base_noclamp (ubyte* q, const(ubyte)* n);
