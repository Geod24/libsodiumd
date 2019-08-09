/*******************************************************************************

    D language bindings for libsodium's crypto_scalarmult_ristretto255.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_scalarmult_ristretto255;

@nogc nothrow:

import libsodium.export_;

extern (C):

enum crypto_scalarmult_ristretto255_BYTES = 32U;
size_t crypto_scalarmult_ristretto255_bytes ();

enum crypto_scalarmult_ristretto255_SCALARBYTES = 32U;
size_t crypto_scalarmult_ristretto255_scalarbytes ();

/*
 * NOTE: Do not use the result of this function directly for key exchange.
 *
 * Hash the result with the public keys in order to compute a shared
 * secret key: H(q || client_pk || server_pk)
 *
 * Or unless this is not an option, use the crypto_kx() API instead.
 */
int crypto_scalarmult_ristretto255 (ubyte* q, const(ubyte)* n, const(ubyte)* p);

int crypto_scalarmult_ristretto255_base (ubyte* q, const(ubyte)* n);
