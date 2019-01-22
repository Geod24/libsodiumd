/*******************************************************************************

    D language bindings for libsodium's crypto_secretbox_xchacha20poly1305.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_secretbox_xchacha20poly1305;

@nogc nothrow:

import libsodium.export_;
import libsodium.crypto_stream_xchacha20;

extern (C):

enum crypto_secretbox_xchacha20poly1305_KEYBYTES = 32U;
size_t crypto_secretbox_xchacha20poly1305_keybytes ();

enum crypto_secretbox_xchacha20poly1305_NONCEBYTES = 24U;
size_t crypto_secretbox_xchacha20poly1305_noncebytes ();

enum crypto_secretbox_xchacha20poly1305_MACBYTES = 16U;
size_t crypto_secretbox_xchacha20poly1305_macbytes ();

enum crypto_secretbox_xchacha20poly1305_MESSAGEBYTES_MAX = crypto_stream_xchacha20_MESSAGEBYTES_MAX - crypto_secretbox_xchacha20poly1305_MACBYTES;
size_t crypto_secretbox_xchacha20poly1305_messagebytes_max ();

int crypto_secretbox_xchacha20poly1305_easy (
    ubyte* c,
    const(ubyte)* m,
    ulong mlen,
    const(ubyte)* n,
    const(ubyte)* k);

int crypto_secretbox_xchacha20poly1305_open_easy (
    ubyte* m,
    const(ubyte)* c,
    ulong clen,
    const(ubyte)* n,
    const(ubyte)* k);

int crypto_secretbox_xchacha20poly1305_detached (
    ubyte* c,
    ubyte* mac,
    const(ubyte)* m,
    ulong mlen,
    const(ubyte)* n,
    const(ubyte)* k);

int crypto_secretbox_xchacha20poly1305_open_detached (
    ubyte* m,
    const(ubyte)* c,
    const(ubyte)* mac,
    ulong clen,
    const(ubyte)* n,
    const(ubyte)* k);
