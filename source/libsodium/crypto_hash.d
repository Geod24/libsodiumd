/*******************************************************************************

    D language bindings for libsodium's crypto_hash.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_hash;

@nogc nothrow:

import libsodium.export_;
import libsodium.crypto_hash_sha512;

extern (C):

/*
 * WARNING: Unless you absolutely need to use SHA512 for interoperatibility,
 * purposes, you might want to consider crypto_generichash() instead.
 * Unlike SHA512, crypto_generichash() is not vulnerable to length
 * extension attacks.
 */

enum crypto_hash_BYTES = crypto_hash_sha512_BYTES;
size_t crypto_hash_bytes ();

int crypto_hash (ubyte* out_, const(ubyte)* in_, ulong inlen);

enum crypto_hash_PRIMITIVE = "sha512";
const(char)* crypto_hash_primitive ();
