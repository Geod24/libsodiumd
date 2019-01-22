/*******************************************************************************

    D language bindings for libsodium's crypto_core_salsa20.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_core_salsa20;

@nogc nothrow:

import libsodium.export_;

extern (C):

enum crypto_core_salsa20_OUTPUTBYTES = 64U;
size_t crypto_core_salsa20_outputbytes ();

enum crypto_core_salsa20_INPUTBYTES = 16U;
size_t crypto_core_salsa20_inputbytes ();

enum crypto_core_salsa20_KEYBYTES = 32U;
size_t crypto_core_salsa20_keybytes ();

enum crypto_core_salsa20_CONSTBYTES = 16U;
size_t crypto_core_salsa20_constbytes ();

int crypto_core_salsa20 (
    ubyte* out_,
    const(ubyte)* in_,
    const(ubyte)* k,
    const(ubyte)* c);
