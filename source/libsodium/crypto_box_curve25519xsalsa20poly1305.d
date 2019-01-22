/*******************************************************************************

    D language bindings for libsodium's crypto_box_curve25519xsalsa20poly1305.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_box_curve25519xsalsa20poly1305;

@nogc nothrow:

import libsodium.export_;
import libsodium.crypto_stream_xsalsa20;

extern (C):

enum crypto_box_curve25519xsalsa20poly1305_SEEDBYTES = 32U;
size_t crypto_box_curve25519xsalsa20poly1305_seedbytes ();

enum crypto_box_curve25519xsalsa20poly1305_PUBLICKEYBYTES = 32U;
size_t crypto_box_curve25519xsalsa20poly1305_publickeybytes ();

enum crypto_box_curve25519xsalsa20poly1305_SECRETKEYBYTES = 32U;
size_t crypto_box_curve25519xsalsa20poly1305_secretkeybytes ();

enum crypto_box_curve25519xsalsa20poly1305_BEFORENMBYTES = 32U;
size_t crypto_box_curve25519xsalsa20poly1305_beforenmbytes ();

enum crypto_box_curve25519xsalsa20poly1305_NONCEBYTES = 24U;
size_t crypto_box_curve25519xsalsa20poly1305_noncebytes ();

enum crypto_box_curve25519xsalsa20poly1305_MACBYTES = 16U;
size_t crypto_box_curve25519xsalsa20poly1305_macbytes ();

/* Only for the libsodium API - The NaCl compatibility API would require BOXZEROBYTES extra bytes */
enum crypto_box_curve25519xsalsa20poly1305_MESSAGEBYTES_MAX = crypto_stream_xsalsa20_MESSAGEBYTES_MAX - crypto_box_curve25519xsalsa20poly1305_MACBYTES;
size_t crypto_box_curve25519xsalsa20poly1305_messagebytes_max ();

int crypto_box_curve25519xsalsa20poly1305_seed_keypair (
    ubyte* pk,
    ubyte* sk,
    const(ubyte)* seed);

int crypto_box_curve25519xsalsa20poly1305_keypair (ubyte* pk, ubyte* sk);

int crypto_box_curve25519xsalsa20poly1305_beforenm (
    ubyte* k,
    const(ubyte)* pk,
    const(ubyte)* sk);

/* -- NaCl compatibility interface ; Requires padding -- */

enum crypto_box_curve25519xsalsa20poly1305_BOXZEROBYTES = 16U;
size_t crypto_box_curve25519xsalsa20poly1305_boxzerobytes ();

enum crypto_box_curve25519xsalsa20poly1305_ZEROBYTES = crypto_box_curve25519xsalsa20poly1305_BOXZEROBYTES + crypto_box_curve25519xsalsa20poly1305_MACBYTES;
size_t crypto_box_curve25519xsalsa20poly1305_zerobytes ();

int crypto_box_curve25519xsalsa20poly1305 (
    ubyte* c,
    const(ubyte)* m,
    ulong mlen,
    const(ubyte)* n,
    const(ubyte)* pk,
    const(ubyte)* sk);

int crypto_box_curve25519xsalsa20poly1305_open (
    ubyte* m,
    const(ubyte)* c,
    ulong clen,
    const(ubyte)* n,
    const(ubyte)* pk,
    const(ubyte)* sk);

int crypto_box_curve25519xsalsa20poly1305_afternm (
    ubyte* c,
    const(ubyte)* m,
    ulong mlen,
    const(ubyte)* n,
    const(ubyte)* k);

int crypto_box_curve25519xsalsa20poly1305_open_afternm (
    ubyte* m,
    const(ubyte)* c,
    ulong clen,
    const(ubyte)* n,
    const(ubyte)* k);
