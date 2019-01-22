/*******************************************************************************

    D language bindings for libsodium's crypto_secretbox_xsalsa20poly1305.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_secretbox_xsalsa20poly1305;

@nogc nothrow:

import libsodium.export_;
import libsodium.crypto_stream_xsalsa20;

extern (C):

enum crypto_secretbox_xsalsa20poly1305_KEYBYTES = 32U;
size_t crypto_secretbox_xsalsa20poly1305_keybytes ();

enum crypto_secretbox_xsalsa20poly1305_NONCEBYTES = 24U;
size_t crypto_secretbox_xsalsa20poly1305_noncebytes ();

enum crypto_secretbox_xsalsa20poly1305_MACBYTES = 16U;
size_t crypto_secretbox_xsalsa20poly1305_macbytes ();

/* Only for the libsodium API - The NaCl compatibility API would require BOXZEROBYTES extra bytes */
enum crypto_secretbox_xsalsa20poly1305_MESSAGEBYTES_MAX = crypto_stream_xsalsa20_MESSAGEBYTES_MAX - crypto_secretbox_xsalsa20poly1305_MACBYTES;
size_t crypto_secretbox_xsalsa20poly1305_messagebytes_max ();

int crypto_secretbox_xsalsa20poly1305 (
    ubyte* c,
    const(ubyte)* m,
    ulong mlen,
    const(ubyte)* n,
    const(ubyte)* k);

int crypto_secretbox_xsalsa20poly1305_open (
    ubyte* m,
    const(ubyte)* c,
    ulong clen,
    const(ubyte)* n,
    const(ubyte)* k);

void crypto_secretbox_xsalsa20poly1305_keygen (
    ref ubyte[crypto_secretbox_xsalsa20poly1305_KEYBYTES] k);

/* -- NaCl compatibility interface ; Requires padding -- */

enum crypto_secretbox_xsalsa20poly1305_BOXZEROBYTES = 16U;
size_t crypto_secretbox_xsalsa20poly1305_boxzerobytes ();

enum crypto_secretbox_xsalsa20poly1305_ZEROBYTES = crypto_secretbox_xsalsa20poly1305_BOXZEROBYTES + crypto_secretbox_xsalsa20poly1305_MACBYTES;
size_t crypto_secretbox_xsalsa20poly1305_zerobytes ();
