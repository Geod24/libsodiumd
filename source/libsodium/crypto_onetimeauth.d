/*******************************************************************************

    D language bindings for libsodium's crypto_onetimeauth.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_onetimeauth;

@nogc nothrow:

import libsodium.export_;
import libsodium.crypto_onetimeauth_poly1305;

extern (C):

alias crypto_onetimeauth_state = crypto_onetimeauth_poly1305_state;

size_t crypto_onetimeauth_statebytes ();

enum crypto_onetimeauth_BYTES = crypto_onetimeauth_poly1305_BYTES;
size_t crypto_onetimeauth_bytes ();

enum crypto_onetimeauth_KEYBYTES = crypto_onetimeauth_poly1305_KEYBYTES;
size_t crypto_onetimeauth_keybytes ();

enum crypto_onetimeauth_PRIMITIVE = "poly1305";
const(char)* crypto_onetimeauth_primitive ();

int crypto_onetimeauth (
    ubyte* out_,
    const(ubyte)* in_,
    ulong inlen,
    const(ubyte)* k);

int crypto_onetimeauth_verify (
    const(ubyte)* h,
    const(ubyte)* in_,
    ulong inlen,
    const(ubyte)* k);

int crypto_onetimeauth_init (
    crypto_onetimeauth_state* state,
    const(ubyte)* key);

int crypto_onetimeauth_update (
    crypto_onetimeauth_state* state,
    const(ubyte)* in_,
    ulong inlen);

int crypto_onetimeauth_final (crypto_onetimeauth_state* state, ubyte* out_);

void crypto_onetimeauth_keygen (ref ubyte[crypto_onetimeauth_KEYBYTES] k);
