/*******************************************************************************

    D language bindings for libsodium's runtime.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.runtime;

@nogc nothrow:

import libsodium.export_;

extern (C):

int sodium_runtime_has_neon ();

int sodium_runtime_has_sse2 ();

int sodium_runtime_has_sse3 ();

int sodium_runtime_has_ssse3 ();

int sodium_runtime_has_sse41 ();

int sodium_runtime_has_avx ();

int sodium_runtime_has_avx2 ();

int sodium_runtime_has_avx512f ();

int sodium_runtime_has_pclmul ();

int sodium_runtime_has_aesni ();

int sodium_runtime_has_rdrand ();

/* ------------------------------------------------------------------------- */

int _sodium_runtime_get_cpu_features ();
