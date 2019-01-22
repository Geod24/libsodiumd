/*******************************************************************************

    D language bindings for libsodium's crypto_core_hsalsa20.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_core_hsalsa20;

@nogc nothrow:

import libsodium.export_;

extern (C):

enum crypto_core_hsalsa20_OUTPUTBYTES = 32U;
size_t crypto_core_hsalsa20_outputbytes ();

enum crypto_core_hsalsa20_INPUTBYTES = 16U;
size_t crypto_core_hsalsa20_inputbytes ();

enum crypto_core_hsalsa20_KEYBYTES = 32U;
size_t crypto_core_hsalsa20_keybytes ();

enum crypto_core_hsalsa20_CONSTBYTES = 16U;
size_t crypto_core_hsalsa20_constbytes ();

int crypto_core_hsalsa20 (
    ubyte* out_,
    const(ubyte)* in_,
    const(ubyte)* k,
    const(ubyte)* c);
