/*******************************************************************************

    D language bindings for libsodium's crypto_pwhash_scryptsalsa208sha256.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_pwhash_scryptsalsa208sha256;

@nogc nothrow:

import libsodium.export_;
import core.stdc.stdint;

extern (C):

enum crypto_pwhash_scryptsalsa208sha256_BYTES_MIN = 16U;
size_t crypto_pwhash_scryptsalsa208sha256_bytes_min ();

enum crypto_pwhash_scryptsalsa208sha256_BYTES_MAX = SODIUM_MIN(SODIUM_SIZE_MAX, 0x1fffffffe0UL);
size_t crypto_pwhash_scryptsalsa208sha256_bytes_max ();

enum crypto_pwhash_scryptsalsa208sha256_PASSWD_MIN = 0U;
size_t crypto_pwhash_scryptsalsa208sha256_passwd_min ();

enum crypto_pwhash_scryptsalsa208sha256_PASSWD_MAX = SODIUM_SIZE_MAX;
size_t crypto_pwhash_scryptsalsa208sha256_passwd_max ();

enum crypto_pwhash_scryptsalsa208sha256_SALTBYTES = 32U;
size_t crypto_pwhash_scryptsalsa208sha256_saltbytes ();

enum crypto_pwhash_scryptsalsa208sha256_STRBYTES = 102U;
size_t crypto_pwhash_scryptsalsa208sha256_strbytes ();

enum crypto_pwhash_scryptsalsa208sha256_STRPREFIX = "$7$";
const(char)* crypto_pwhash_scryptsalsa208sha256_strprefix ();

enum crypto_pwhash_scryptsalsa208sha256_OPSLIMIT_MIN = 32768U;
size_t crypto_pwhash_scryptsalsa208sha256_opslimit_min ();

enum crypto_pwhash_scryptsalsa208sha256_OPSLIMIT_MAX = 4294967295U;
size_t crypto_pwhash_scryptsalsa208sha256_opslimit_max ();

enum crypto_pwhash_scryptsalsa208sha256_MEMLIMIT_MIN = 16777216U;
size_t crypto_pwhash_scryptsalsa208sha256_memlimit_min ();

enum crypto_pwhash_scryptsalsa208sha256_MEMLIMIT_MAX = SODIUM_MIN(SIZE_MAX, 68719476736UL);
size_t crypto_pwhash_scryptsalsa208sha256_memlimit_max ();

enum crypto_pwhash_scryptsalsa208sha256_OPSLIMIT_INTERACTIVE = 524288U;
size_t crypto_pwhash_scryptsalsa208sha256_opslimit_interactive ();

enum crypto_pwhash_scryptsalsa208sha256_MEMLIMIT_INTERACTIVE = 16777216U;
size_t crypto_pwhash_scryptsalsa208sha256_memlimit_interactive ();

enum crypto_pwhash_scryptsalsa208sha256_OPSLIMIT_SENSITIVE = 33554432U;
size_t crypto_pwhash_scryptsalsa208sha256_opslimit_sensitive ();

enum crypto_pwhash_scryptsalsa208sha256_MEMLIMIT_SENSITIVE = 1073741824U;
size_t crypto_pwhash_scryptsalsa208sha256_memlimit_sensitive ();

int crypto_pwhash_scryptsalsa208sha256 (
    ubyte* out_,
    ulong outlen,
    const char* passwd,
    ulong passwdlen,
    const ubyte* salt,
    ulong opslimit,
    size_t memlimit);

int crypto_pwhash_scryptsalsa208sha256_str (
    ref char[crypto_pwhash_scryptsalsa208sha256_STRBYTES] out_,
    const char* passwd,
    ulong passwdlen,
    ulong opslimit,
    size_t memlimit);

int crypto_pwhash_scryptsalsa208sha256_str_verify (
    ref const(char)[crypto_pwhash_scryptsalsa208sha256_STRBYTES] str,
    const char* passwd,
    ulong passwdlen);

int crypto_pwhash_scryptsalsa208sha256_ll (
    const(ubyte)* passwd,
    size_t passwdlen,
    const(ubyte)* salt,
    size_t saltlen,
    ulong N,
    uint r,
    uint p,
    ubyte* buf,
    size_t buflen);

int crypto_pwhash_scryptsalsa208sha256_str_needs_rehash (
    ref const(char)[crypto_pwhash_scryptsalsa208sha256_STRBYTES] str,
    ulong opslimit,
    size_t memlimit);
