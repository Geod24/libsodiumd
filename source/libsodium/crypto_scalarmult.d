/*******************************************************************************

    D language bindings for libsodium's crypto_scalarmult.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_scalarmult;

@nogc nothrow:

import libsodium.export_;
import libsodium.crypto_scalarmult_curve25519;

extern (C):

enum crypto_scalarmult_BYTES = crypto_scalarmult_curve25519_BYTES;
size_t crypto_scalarmult_bytes ();

enum crypto_scalarmult_SCALARBYTES = crypto_scalarmult_curve25519_SCALARBYTES;
size_t crypto_scalarmult_scalarbytes ();

enum crypto_scalarmult_PRIMITIVE = "curve25519";
const(char)* crypto_scalarmult_primitive ();

int crypto_scalarmult_base (ubyte* q, const(ubyte)* n);

/*
 * NOTE: Do not use the result of this function directly.
 *
 * Hash the result with the public keys in order to compute a shared
 * secret key: H(q || client_pk || server_pk)
 *
 * Or unless this is not an option, use the crypto_kx() API instead.
 */
int crypto_scalarmult (ubyte* q, const(ubyte)* n, const(ubyte)* p);
