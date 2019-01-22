/*******************************************************************************

    D language bindings for libsodium's crypto_pwhash_argon2i.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_pwhash_argon2i;

@nogc nothrow:

import libsodium.export_;
import core.stdc.stdint;

extern (C):

enum crypto_pwhash_argon2i_ALG_ARGON2I13 = 1;
int crypto_pwhash_argon2i_alg_argon2i13 ();

enum crypto_pwhash_argon2i_BYTES_MIN = 16U;
size_t crypto_pwhash_argon2i_bytes_min ();

enum crypto_pwhash_argon2i_BYTES_MAX = SODIUM_MIN(SODIUM_SIZE_MAX, 4294967295U);
size_t crypto_pwhash_argon2i_bytes_max ();

enum crypto_pwhash_argon2i_PASSWD_MIN = 0U;
size_t crypto_pwhash_argon2i_passwd_min ();

enum crypto_pwhash_argon2i_PASSWD_MAX = 4294967295U;
size_t crypto_pwhash_argon2i_passwd_max ();

enum crypto_pwhash_argon2i_SALTBYTES = 16U;
size_t crypto_pwhash_argon2i_saltbytes ();

enum crypto_pwhash_argon2i_STRBYTES = 128U;
size_t crypto_pwhash_argon2i_strbytes ();

enum crypto_pwhash_argon2i_STRPREFIX = "$argon2i$";
const(char)* crypto_pwhash_argon2i_strprefix ();

enum crypto_pwhash_argon2i_OPSLIMIT_MIN = 3U;
size_t crypto_pwhash_argon2i_opslimit_min ();

enum crypto_pwhash_argon2i_OPSLIMIT_MAX = 4294967295U;
size_t crypto_pwhash_argon2i_opslimit_max ();

enum crypto_pwhash_argon2i_MEMLIMIT_MIN = 8192U;
size_t crypto_pwhash_argon2i_memlimit_min ();

enum crypto_pwhash_argon2i_MEMLIMIT_MAX = (SIZE_MAX >= 4398046510080U) ? 4398046510080U : (SIZE_MAX >= 2147483648U) ? 2147483648U : 32768U;
size_t crypto_pwhash_argon2i_memlimit_max ();

enum crypto_pwhash_argon2i_OPSLIMIT_INTERACTIVE = 4U;
size_t crypto_pwhash_argon2i_opslimit_interactive ();

enum crypto_pwhash_argon2i_MEMLIMIT_INTERACTIVE = 33554432U;
size_t crypto_pwhash_argon2i_memlimit_interactive ();

enum crypto_pwhash_argon2i_OPSLIMIT_MODERATE = 6U;
size_t crypto_pwhash_argon2i_opslimit_moderate ();

enum crypto_pwhash_argon2i_MEMLIMIT_MODERATE = 134217728U;
size_t crypto_pwhash_argon2i_memlimit_moderate ();

enum crypto_pwhash_argon2i_OPSLIMIT_SENSITIVE = 8U;
size_t crypto_pwhash_argon2i_opslimit_sensitive ();

enum crypto_pwhash_argon2i_MEMLIMIT_SENSITIVE = 536870912U;
size_t crypto_pwhash_argon2i_memlimit_sensitive ();

int crypto_pwhash_argon2i (
    ubyte* out_,
    ulong outlen,
    const char* passwd,
    ulong passwdlen,
    const ubyte* salt,
    ulong opslimit,
    size_t memlimit,
    int alg);

int crypto_pwhash_argon2i_str (
    ref char[crypto_pwhash_argon2i_STRBYTES] out_,
    const char* passwd,
    ulong passwdlen,
    ulong opslimit,
    size_t memlimit);

int crypto_pwhash_argon2i_str_verify (
    ref const(char)[crypto_pwhash_argon2i_STRBYTES] str,
    const char* passwd,
    ulong passwdlen);

int crypto_pwhash_argon2i_str_needs_rehash (
    ref const(char)[crypto_pwhash_argon2i_STRBYTES] str,
    ulong opslimit,
    size_t memlimit);
