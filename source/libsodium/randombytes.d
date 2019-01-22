/*******************************************************************************

    D language bindings for libsodium's randombytes.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.randombytes;

@nogc nothrow:

import libsodium.export_;

extern (C):

struct randombytes_implementation
{
    const(char)* function () implementation_name; /* required */
    uint function () random; /* required */
    void function () stir; /* optional */
    uint function (const uint upper_bound) uniform; /* optional, a default implementation will be used if NULL */
    void function (void* buf, const size_t size) buf; /* required */
    int function () close; /* optional */
}

enum randombytes_BYTES_MAX = SODIUM_MIN(SODIUM_SIZE_MAX, 0xffffffffUL);

enum randombytes_SEEDBYTES = 32U;
size_t randombytes_seedbytes ();

void randombytes_buf (void* buf, const size_t size);

void randombytes_buf_deterministic (
    void* buf,
    const size_t size,
    ref const(ubyte)[randombytes_SEEDBYTES] seed);

uint randombytes_random ();

uint randombytes_uniform (const uint upper_bound);

void randombytes_stir ();

int randombytes_close ();

int randombytes_set_implementation (randombytes_implementation* impl);

const(char)* randombytes_implementation_name ();

/* -- NaCl compatibility interface -- */

void randombytes (ubyte* buf, const ulong buf_len);
