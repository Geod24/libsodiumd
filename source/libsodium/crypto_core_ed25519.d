/*******************************************************************************

    D language bindings for libsodium's crypto_core_ed25519.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_core_ed25519;

@nogc nothrow:

import libsodium.export_;

extern (C):

enum crypto_core_ed25519_BYTES = 32;
size_t crypto_core_ed25519_bytes ();

enum crypto_core_ed25519_UNIFORMBYTES = 32;
size_t crypto_core_ed25519_uniformbytes ();

enum crypto_core_ed25519_SCALARBYTES = 32;
size_t crypto_core_ed25519_scalarbytes ();

enum crypto_core_ed25519_NONREDUCEDSCALARBYTES = 64;
size_t crypto_core_ed25519_nonreducedscalarbytes ();

int crypto_core_ed25519_is_valid_point (const(ubyte)* p);

int crypto_core_ed25519_add (ubyte* r, const(ubyte)* p, const(ubyte)* q);

int crypto_core_ed25519_sub (ubyte* r, const(ubyte)* p, const(ubyte)* q);

int crypto_core_ed25519_from_uniform (ubyte* p, const(ubyte)* r);

void crypto_core_ed25519_scalar_random (ubyte* r);

int crypto_core_ed25519_scalar_invert (ubyte* recip, const(ubyte)* s);

void crypto_core_ed25519_scalar_negate (ubyte* neg, const(ubyte)* s);

void crypto_core_ed25519_scalar_complement (ubyte* comp, const(ubyte)* s);

void crypto_core_ed25519_scalar_add (
    ubyte* z,
    const(ubyte)* x,
    const(ubyte)* y);

void crypto_core_ed25519_scalar_sub (
    ubyte* z,
    const(ubyte)* x,
    const(ubyte)* y);

/*
 * The interval `s` is sampled from should be at least 317 bits to ensure almost
 * uniformity of `r` over `L`.
 */
void crypto_core_ed25519_scalar_reduce (ubyte* r, const(ubyte)* s);
