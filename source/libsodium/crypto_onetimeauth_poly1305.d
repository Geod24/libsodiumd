/*******************************************************************************

    D language bindings for libsodium's crypto_onetimeauth_poly1305.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_onetimeauth_poly1305;

@nogc nothrow:

import libsodium.export_;

extern (C):

struct crypto_onetimeauth_poly1305_state
{
    ubyte[256] opaque;
}

size_t crypto_onetimeauth_poly1305_statebytes ();

enum crypto_onetimeauth_poly1305_BYTES = 16U;
size_t crypto_onetimeauth_poly1305_bytes ();

enum crypto_onetimeauth_poly1305_KEYBYTES = 32U;
size_t crypto_onetimeauth_poly1305_keybytes ();

int crypto_onetimeauth_poly1305 (
    ubyte* out_,
    const(ubyte)* in_,
    ulong inlen,
    const(ubyte)* k);

int crypto_onetimeauth_poly1305_verify (
    const(ubyte)* h,
    const(ubyte)* in_,
    ulong inlen,
    const(ubyte)* k);

int crypto_onetimeauth_poly1305_init (
    crypto_onetimeauth_poly1305_state* state,
    const(ubyte)* key);

int crypto_onetimeauth_poly1305_update (
    crypto_onetimeauth_poly1305_state* state,
    const(ubyte)* in_,
    ulong inlen);

int crypto_onetimeauth_poly1305_final (
    crypto_onetimeauth_poly1305_state* state,
    ubyte* out_);

void crypto_onetimeauth_poly1305_keygen (
    ref ubyte[crypto_onetimeauth_poly1305_KEYBYTES] k);
