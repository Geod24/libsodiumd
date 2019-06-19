/*******************************************************************************

    D language bindings for libsodium's crypto_secretbox.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_secretbox;

@nogc nothrow:

import libsodium.export_;
import libsodium.crypto_secretbox_xsalsa20poly1305;

extern (C):

enum crypto_secretbox_KEYBYTES = crypto_secretbox_xsalsa20poly1305_KEYBYTES;
size_t crypto_secretbox_keybytes ();

enum crypto_secretbox_NONCEBYTES = crypto_secretbox_xsalsa20poly1305_NONCEBYTES;
size_t crypto_secretbox_noncebytes ();

enum crypto_secretbox_MACBYTES = crypto_secretbox_xsalsa20poly1305_MACBYTES;
size_t crypto_secretbox_macbytes ();

enum crypto_secretbox_PRIMITIVE = "xsalsa20poly1305";
const(char)* crypto_secretbox_primitive ();

enum crypto_secretbox_MESSAGEBYTES_MAX = crypto_secretbox_xsalsa20poly1305_MESSAGEBYTES_MAX;
size_t crypto_secretbox_messagebytes_max ();

int crypto_secretbox_easy (
    ubyte* c,
    const(ubyte)* m,
    ulong mlen,
    const(ubyte)* n,
    const(ubyte)* k);

int crypto_secretbox_open_easy (
    ubyte* m,
    const(ubyte)* c,
    ulong clen,
    const(ubyte)* n,
    const(ubyte)* k);

int crypto_secretbox_detached (
    ubyte* c,
    ubyte* mac,
    const(ubyte)* m,
    ulong mlen,
    const(ubyte)* n,
    const(ubyte)* k);

int crypto_secretbox_open_detached (
    ubyte* m,
    const(ubyte)* c,
    const(ubyte)* mac,
    ulong clen,
    const(ubyte)* n,
    const(ubyte)* k);

/**
 * Generate a random keypair to use with `crypto_secretbox_*` functions
 *
 * This function just wraps a call to `randombytes_buf`
 * It was introduced in v1.0.10, which is older than the Travis-CI package
 * For ease of use, a D implementation is provided.
 *
 * See_Also:
 *   https://github.com/jedisct1/libsodium/blob/1.0.17/src/libsodium/crypto_secretbox/crypto_secretbox.c#L63-L67
 */
extern(D) void crypto_secretbox_keygen (ref ubyte[crypto_secretbox_KEYBYTES] k)
{
    import libsodium.randombytes;
    randombytes_buf(k.ptr, crypto_secretbox_KEYBYTES);
}

/* -- NaCl compatibility interface ; Requires padding -- */

enum crypto_secretbox_ZEROBYTES = crypto_secretbox_xsalsa20poly1305_ZEROBYTES;
size_t crypto_secretbox_zerobytes ();

enum crypto_secretbox_BOXZEROBYTES = crypto_secretbox_xsalsa20poly1305_BOXZEROBYTES;
size_t crypto_secretbox_boxzerobytes ();

int crypto_secretbox (
    ubyte* c,
    const(ubyte)* m,
    ulong mlen,
    const(ubyte)* n,
    const(ubyte)* k);

int crypto_secretbox_open (
    ubyte* m,
    const(ubyte)* c,
    ulong clen,
    const(ubyte)* n,
    const(ubyte)* k);
