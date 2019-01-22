/*******************************************************************************

    D language bindings for libsodium's crypto_stream.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_stream;

@nogc nothrow:

import libsodium.export_;
import libsodium.crypto_stream_xsalsa20;

extern (C):

/*
 *  WARNING: This is just a stream cipher. It is NOT authenticated encryption.
 *  While it provides some protection against eavesdropping, it does NOT
 *  provide any security against active attacks.
 *  Unless you know what you're doing, what you are looking for is probably
 *  the crypto_box functions.
 */

enum crypto_stream_KEYBYTES = crypto_stream_xsalsa20_KEYBYTES;
size_t crypto_stream_keybytes ();

enum crypto_stream_NONCEBYTES = crypto_stream_xsalsa20_NONCEBYTES;
size_t crypto_stream_noncebytes ();

enum crypto_stream_MESSAGEBYTES_MAX = crypto_stream_xsalsa20_MESSAGEBYTES_MAX;
size_t crypto_stream_messagebytes_max ();

enum crypto_stream_PRIMITIVE = "xsalsa20";
const(char)* crypto_stream_primitive ();

int crypto_stream (ubyte* c, ulong clen, const(ubyte)* n, const(ubyte)* k);

int crypto_stream_xor (
    ubyte* c,
    const(ubyte)* m,
    ulong mlen,
    const(ubyte)* n,
    const(ubyte)* k);

void crypto_stream_keygen (ref ubyte[crypto_stream_KEYBYTES] k);
