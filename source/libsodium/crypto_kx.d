/*******************************************************************************

    D language bindings for libsodium's crypto_kx.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_kx;

@nogc nothrow:

import libsodium.export_;

extern (C):

enum crypto_kx_PUBLICKEYBYTES = 32;
size_t crypto_kx_publickeybytes ();

enum crypto_kx_SECRETKEYBYTES = 32;
size_t crypto_kx_secretkeybytes ();

enum crypto_kx_SEEDBYTES = 32;
size_t crypto_kx_seedbytes ();

enum crypto_kx_SESSIONKEYBYTES = 32;
size_t crypto_kx_sessionkeybytes ();

enum crypto_kx_PRIMITIVE = "x25519blake2b";
const(char)* crypto_kx_primitive ();

int crypto_kx_seed_keypair (
    ref ubyte[crypto_kx_PUBLICKEYBYTES] pk,
    ref ubyte[crypto_kx_SECRETKEYBYTES] sk,
    ref const(ubyte)[crypto_kx_SEEDBYTES] seed);

int crypto_kx_keypair (
    ref ubyte[crypto_kx_PUBLICKEYBYTES] pk,
    ref ubyte[crypto_kx_SECRETKEYBYTES] sk);

int crypto_kx_client_session_keys (
    ref ubyte[crypto_kx_SESSIONKEYBYTES] rx,
    ref ubyte[crypto_kx_SESSIONKEYBYTES] tx,
    ref const(ubyte)[crypto_kx_PUBLICKEYBYTES] client_pk,
    ref const(ubyte)[crypto_kx_SECRETKEYBYTES] client_sk,
    ref const(ubyte)[crypto_kx_PUBLICKEYBYTES] server_pk);

int crypto_kx_server_session_keys (
    ref ubyte[crypto_kx_SESSIONKEYBYTES] rx,
    ref ubyte[crypto_kx_SESSIONKEYBYTES] tx,
    ref const(ubyte)[crypto_kx_PUBLICKEYBYTES] server_pk,
    ref const(ubyte)[crypto_kx_SECRETKEYBYTES] server_sk,
    ref const(ubyte)[crypto_kx_PUBLICKEYBYTES] client_pk);
