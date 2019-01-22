/*******************************************************************************

    D language bindings for libsodium's crypto_shorthash.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_shorthash;

@nogc nothrow:

import libsodium.export_;
import libsodium.crypto_shorthash_siphash24;

extern (C):

enum crypto_shorthash_BYTES = crypto_shorthash_siphash24_BYTES;
size_t crypto_shorthash_bytes ();

enum crypto_shorthash_KEYBYTES = crypto_shorthash_siphash24_KEYBYTES;
size_t crypto_shorthash_keybytes ();

enum crypto_shorthash_PRIMITIVE = "siphash24";
const(char)* crypto_shorthash_primitive ();

int crypto_shorthash (
    ubyte* out_,
    const(ubyte)* in_,
    ulong inlen,
    const(ubyte)* k);

void crypto_shorthash_keygen (ref ubyte[crypto_shorthash_KEYBYTES] k);
