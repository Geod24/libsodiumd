/*******************************************************************************

    D language bindings for libsodium's crypto_kdf.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_kdf;

@nogc nothrow:

import libsodium.export_;
import libsodium.crypto_kdf_blake2b;

extern (C):

enum crypto_kdf_BYTES_MIN = crypto_kdf_blake2b_BYTES_MIN;
size_t crypto_kdf_bytes_min ();

enum crypto_kdf_BYTES_MAX = crypto_kdf_blake2b_BYTES_MAX;
size_t crypto_kdf_bytes_max ();

enum crypto_kdf_CONTEXTBYTES = crypto_kdf_blake2b_CONTEXTBYTES;
size_t crypto_kdf_contextbytes ();

enum crypto_kdf_KEYBYTES = crypto_kdf_blake2b_KEYBYTES;
size_t crypto_kdf_keybytes ();

enum crypto_kdf_PRIMITIVE = "blake2b";
const(char)* crypto_kdf_primitive ();

int crypto_kdf_derive_from_key (
    ubyte* subkey,
    size_t subkey_len,
    ulong subkey_id,
    ref const(char)[crypto_kdf_CONTEXTBYTES] ctx,
    ref const(ubyte)[crypto_kdf_KEYBYTES] key);

void crypto_kdf_keygen (ref ubyte[crypto_kdf_KEYBYTES] k);
