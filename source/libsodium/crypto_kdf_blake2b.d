/*******************************************************************************

    D language bindings for libsodium's crypto_kdf_blake2b.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_kdf_blake2b;

@nogc nothrow:

import libsodium.export_;

extern (C):

enum crypto_kdf_blake2b_BYTES_MIN = 16;
size_t crypto_kdf_blake2b_bytes_min ();

enum crypto_kdf_blake2b_BYTES_MAX = 64;
size_t crypto_kdf_blake2b_bytes_max ();

enum crypto_kdf_blake2b_CONTEXTBYTES = 8;
size_t crypto_kdf_blake2b_contextbytes ();

enum crypto_kdf_blake2b_KEYBYTES = 32;
size_t crypto_kdf_blake2b_keybytes ();

int crypto_kdf_blake2b_derive_from_key (
    ubyte* subkey,
    size_t subkey_len,
    ulong subkey_id,
    ref const(char)[crypto_kdf_blake2b_CONTEXTBYTES] ctx,
    ref const(ubyte)[crypto_kdf_blake2b_KEYBYTES] key);
