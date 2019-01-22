/*******************************************************************************

    D language bindings for libsodium's crypto_pwhash.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_pwhash;

@nogc nothrow:

import libsodium.export_;
import libsodium.crypto_pwhash_argon2i;
import libsodium.crypto_pwhash_argon2id;

extern (C):

enum crypto_pwhash_ALG_ARGON2I13 = crypto_pwhash_argon2i_ALG_ARGON2I13;
int crypto_pwhash_alg_argon2i13 ();

enum crypto_pwhash_ALG_ARGON2ID13 = crypto_pwhash_argon2id_ALG_ARGON2ID13;
int crypto_pwhash_alg_argon2id13 ();

enum crypto_pwhash_ALG_DEFAULT = crypto_pwhash_ALG_ARGON2ID13;
int crypto_pwhash_alg_default ();

enum crypto_pwhash_BYTES_MIN = crypto_pwhash_argon2id_BYTES_MIN;
size_t crypto_pwhash_bytes_min ();

enum crypto_pwhash_BYTES_MAX = crypto_pwhash_argon2id_BYTES_MAX;
size_t crypto_pwhash_bytes_max ();

enum crypto_pwhash_PASSWD_MIN = crypto_pwhash_argon2id_PASSWD_MIN;
size_t crypto_pwhash_passwd_min ();

enum crypto_pwhash_PASSWD_MAX = crypto_pwhash_argon2id_PASSWD_MAX;
size_t crypto_pwhash_passwd_max ();

enum crypto_pwhash_SALTBYTES = crypto_pwhash_argon2id_SALTBYTES;
size_t crypto_pwhash_saltbytes ();

enum crypto_pwhash_STRBYTES = crypto_pwhash_argon2id_STRBYTES;
size_t crypto_pwhash_strbytes ();

enum crypto_pwhash_STRPREFIX = crypto_pwhash_argon2id_STRPREFIX;
const(char)* crypto_pwhash_strprefix ();

enum crypto_pwhash_OPSLIMIT_MIN = crypto_pwhash_argon2id_OPSLIMIT_MIN;
size_t crypto_pwhash_opslimit_min ();

enum crypto_pwhash_OPSLIMIT_MAX = crypto_pwhash_argon2id_OPSLIMIT_MAX;
size_t crypto_pwhash_opslimit_max ();

enum crypto_pwhash_MEMLIMIT_MIN = crypto_pwhash_argon2id_MEMLIMIT_MIN;
size_t crypto_pwhash_memlimit_min ();

enum crypto_pwhash_MEMLIMIT_MAX = crypto_pwhash_argon2id_MEMLIMIT_MAX;
size_t crypto_pwhash_memlimit_max ();

enum crypto_pwhash_OPSLIMIT_INTERACTIVE = crypto_pwhash_argon2id_OPSLIMIT_INTERACTIVE;
size_t crypto_pwhash_opslimit_interactive ();

enum crypto_pwhash_MEMLIMIT_INTERACTIVE = crypto_pwhash_argon2id_MEMLIMIT_INTERACTIVE;
size_t crypto_pwhash_memlimit_interactive ();

enum crypto_pwhash_OPSLIMIT_MODERATE = crypto_pwhash_argon2id_OPSLIMIT_MODERATE;
size_t crypto_pwhash_opslimit_moderate ();

enum crypto_pwhash_MEMLIMIT_MODERATE = crypto_pwhash_argon2id_MEMLIMIT_MODERATE;
size_t crypto_pwhash_memlimit_moderate ();

enum crypto_pwhash_OPSLIMIT_SENSITIVE = crypto_pwhash_argon2id_OPSLIMIT_SENSITIVE;
size_t crypto_pwhash_opslimit_sensitive ();

enum crypto_pwhash_MEMLIMIT_SENSITIVE = crypto_pwhash_argon2id_MEMLIMIT_SENSITIVE;
size_t crypto_pwhash_memlimit_sensitive ();

/*
 * With this function, do not forget to store all parameters, including the
 * algorithm identifier in order to produce deterministic output.
 * The crypto_pwhash_* definitions, including crypto_pwhash_ALG_DEFAULT,
 * may change.
 */
int crypto_pwhash (
    ubyte* out_,
    ulong outlen,
    const char* passwd,
    ulong passwdlen,
    const ubyte* salt,
    ulong opslimit,
    size_t memlimit,
    int alg);

/*
 * The output string already includes all the required parameters, including
 * the algorithm identifier. The string is all that has to be stored in
 * order to verify a password.
 */
int crypto_pwhash_str (
    ref char[crypto_pwhash_STRBYTES] out_,
    const char* passwd,
    ulong passwdlen,
    ulong opslimit,
    size_t memlimit);

int crypto_pwhash_str_alg (
    ref char[crypto_pwhash_STRBYTES] out_,
    const char* passwd,
    ulong passwdlen,
    ulong opslimit,
    size_t memlimit,
    int alg);

int crypto_pwhash_str_verify (
    ref const(char)[crypto_pwhash_STRBYTES] str,
    const char* passwd,
    ulong passwdlen);

int crypto_pwhash_str_needs_rehash (
    ref const(char)[crypto_pwhash_STRBYTES] str,
    ulong opslimit,
    size_t memlimit);

enum crypto_pwhash_PRIMITIVE = "argon2i";
const(char)* crypto_pwhash_primitive ();
