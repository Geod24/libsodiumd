/*******************************************************************************

    D language bindings for libsodium's crypto_core_salsa2012.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_core_salsa2012;

@nogc nothrow:

import libsodium.export_;

extern (C):

enum crypto_core_salsa2012_OUTPUTBYTES = 64U;
size_t crypto_core_salsa2012_outputbytes ();

enum crypto_core_salsa2012_INPUTBYTES = 16U;
size_t crypto_core_salsa2012_inputbytes ();

enum crypto_core_salsa2012_KEYBYTES = 32U;
size_t crypto_core_salsa2012_keybytes ();

enum crypto_core_salsa2012_CONSTBYTES = 16U;
size_t crypto_core_salsa2012_constbytes ();

int crypto_core_salsa2012 (
    ubyte* out_,
    const(ubyte)* in_,
    const(ubyte)* k,
    const(ubyte)* c);
