/*******************************************************************************

    D language bindings for libsodium's export_.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.export_;

import libsodium.export_;
import core.stdc.stdint;

extern (C):

extern (D) auto SODIUM_MIN(T0, T1)(auto ref T0 A, auto ref T1 B)
{
    return A < B ? A : B;
}

enum SODIUM_SIZE_MAX = SODIUM_MIN(UINT64_MAX, SIZE_MAX);
