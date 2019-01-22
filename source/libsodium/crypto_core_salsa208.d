/*******************************************************************************

    D language bindings for libsodium's crypto_core_salsa208.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_core_salsa208;

@nogc nothrow:

import libsodium.export_;

extern (C):

enum crypto_core_salsa208_OUTPUTBYTES = 64U;
size_t crypto_core_salsa208_outputbytes ();

enum crypto_core_salsa208_INPUTBYTES = 16U;
size_t crypto_core_salsa208_inputbytes ();

enum crypto_core_salsa208_KEYBYTES = 32U;
size_t crypto_core_salsa208_keybytes ();

enum crypto_core_salsa208_CONSTBYTES = 16U;
size_t crypto_core_salsa208_constbytes ();

int crypto_core_salsa208 (
    ubyte* out_,
    const(ubyte)* in_,
    const(ubyte)* k,
    const(ubyte)* c);
