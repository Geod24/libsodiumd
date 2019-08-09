/*******************************************************************************

    D language bindings for libsodium's crypto_core_ristretto255.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_core_ristretto255;

@nogc nothrow:

import libsodium.export_;

extern (C):

enum crypto_core_ristretto255_BYTES = 32;
size_t crypto_core_ristretto255_bytes ();

enum crypto_core_ristretto255_HASHBYTES = 64;
size_t crypto_core_ristretto255_hashbytes ();

enum crypto_core_ristretto255_SCALARBYTES = 32;
size_t crypto_core_ristretto255_scalarbytes ();

enum crypto_core_ristretto255_NONREDUCEDSCALARBYTES = 64;
size_t crypto_core_ristretto255_nonreducedscalarbytes ();

int crypto_core_ristretto255_is_valid_point (const(ubyte)* p);

int crypto_core_ristretto255_add (ubyte* r, const(ubyte)* p, const(ubyte)* q);

int crypto_core_ristretto255_sub (ubyte* r, const(ubyte)* p, const(ubyte)* q);

int crypto_core_ristretto255_from_hash (ubyte* p, const(ubyte)* r);

void crypto_core_ristretto255_random (ubyte* p);

void crypto_core_ristretto255_scalar_random (ubyte* r);

int crypto_core_ristretto255_scalar_invert (ubyte* recip, const(ubyte)* s);

void crypto_core_ristretto255_scalar_negate (ubyte* neg, const(ubyte)* s);

void crypto_core_ristretto255_scalar_complement (ubyte* comp, const(ubyte)* s);

void crypto_core_ristretto255_scalar_add (
    ubyte* z,
    const(ubyte)* x,
    const(ubyte)* y);

void crypto_core_ristretto255_scalar_sub (
    ubyte* z,
    const(ubyte)* x,
    const(ubyte)* y);

void crypto_core_ristretto255_scalar_mul (
    ubyte* z,
    const(ubyte)* x,
    const(ubyte)* y);

/*
 * The interval `s` is sampled from should be at least 317 bits to ensure almost
 * uniformity of `r` over `L`.
 */
void crypto_core_ristretto255_scalar_reduce (ubyte* r, const(ubyte)* s);

