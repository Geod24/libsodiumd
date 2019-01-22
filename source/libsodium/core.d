/*******************************************************************************

    D language bindings for libsodium's core.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.core;

@nogc nothrow:

import libsodium.export_;
extern (C):

int sodium_init ();

/* ---- */

int sodium_set_misuse_handler (void function () handler);

void sodium_misuse ();
