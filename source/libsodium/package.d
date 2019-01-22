/*******************************************************************************

    D language bindings for libsodium's sodium.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium;

public import libsodium.core;
public import libsodium.crypto_aead_aes256gcm;
public import libsodium.crypto_aead_chacha20poly1305;
public import libsodium.crypto_aead_xchacha20poly1305;
public import libsodium.crypto_auth;
public import libsodium.crypto_auth_hmacsha256;
public import libsodium.crypto_auth_hmacsha512256;
public import libsodium.crypto_auth_hmacsha512;
public import libsodium.crypto_box;
public import libsodium.crypto_box_curve25519xchacha20poly1305;
public import libsodium.crypto_box_curve25519xsalsa20poly1305;
public import libsodium.crypto_core_ed25519;
public import libsodium.crypto_core_hchacha20;
public import libsodium.crypto_core_hsalsa20;
public import libsodium.crypto_core_salsa2012;
public import libsodium.crypto_core_salsa208;
public import libsodium.crypto_core_salsa20;
public import libsodium.crypto_generichash;
public import libsodium.crypto_generichash_blake2b;
public import libsodium.crypto_hash;
public import libsodium.crypto_hash_sha256;
public import libsodium.crypto_hash_sha512;
public import libsodium.crypto_kdf;
public import libsodium.crypto_kdf_blake2b;
public import libsodium.crypto_kx;
public import libsodium.crypto_onetimeauth;
public import libsodium.crypto_onetimeauth_poly1305;
public import libsodium.crypto_pwhash;
public import libsodium.crypto_pwhash_argon2i;
public import libsodium.crypto_pwhash_argon2id;
public import libsodium.crypto_pwhash_scryptsalsa208sha256;
public import libsodium.crypto_scalarmult;
public import libsodium.crypto_scalarmult_curve25519;
public import libsodium.crypto_scalarmult_ed25519;
public import libsodium.crypto_secretbox;
public import libsodium.crypto_secretbox_xchacha20poly1305;
public import libsodium.crypto_secretbox_xsalsa20poly1305;
public import libsodium.crypto_secretstream_xchacha20poly1305;
public import libsodium.crypto_shorthash;
public import libsodium.crypto_shorthash_siphash24;
public import libsodium.crypto_sign;
public import libsodium.crypto_sign_ed25519;
public import libsodium.crypto_sign_edwards25519sha512batch;
public import libsodium.crypto_stream;
public import libsodium.crypto_stream_chacha20;
public import libsodium.crypto_stream_salsa2012;
public import libsodium.crypto_stream_salsa208;
public import libsodium.crypto_stream_salsa20;
public import libsodium.crypto_stream_xchacha20;
public import libsodium.crypto_stream_xsalsa20;
public import libsodium.crypto_verify_16;
public import libsodium.crypto_verify_32;
public import libsodium.crypto_verify_64;
public import libsodium.export_;
public import libsodium.randombytes;
public import libsodium.randombytes_nativeclient;
public import libsodium.randombytes_salsa20_random;
public import libsodium.randombytes_sysrandom;
public import libsodium.runtime;
public import libsodium.utils;

version (unittest)
shared static this ()
{
    auto res = sodium_init();
    assert(res >= 0);
}

/// https://libsodium.gitbook.io/doc/secret-key_cryptography/authenticated_encryption
unittest
{
    static immutable message = "Hello world";

    ubyte[crypto_secretbox_KEYBYTES] key;
    ubyte[crypto_secretbox_NONCEBYTES] nonce;
    ubyte[crypto_secretbox_MACBYTES + message.length] cipher;

    crypto_secretbox_keygen(key);
    randombytes_buf(nonce.ptr, nonce.length);
    crypto_secretbox_easy(cipher.ptr, cast(const(ubyte*))message.ptr, message.length,
                          nonce.ptr, key.ptr);

    ubyte[message.length] decrypted;
    if (crypto_secretbox_open_easy(decrypted.ptr, cipher.ptr, cipher.length,
                                   nonce.ptr, key.ptr) != 0) {
        assert(0);
    }
}

/// https://libsodium.gitbook.io/doc/public-key_cryptography/authenticated_encryption
unittest
{
    static immutable message = "authenticated encryption";

    ubyte[crypto_box_PUBLICKEYBYTES] alice_publickey;
    ubyte[crypto_box_SECRETKEYBYTES] alice_secretkey;
    crypto_box_keypair(alice_publickey.ptr, alice_secretkey.ptr);

    ubyte[crypto_box_PUBLICKEYBYTES] bob_publickey;
    ubyte[crypto_box_SECRETKEYBYTES] bob_secretkey;
    crypto_box_keypair(bob_publickey.ptr, bob_secretkey.ptr);

    ubyte[crypto_box_NONCEBYTES] nonce;
    ubyte[crypto_box_MACBYTES + message.length] ciphertext;
    randombytes_buf(nonce.ptr, nonce.length);

    if (crypto_box_easy(ciphertext.ptr, cast(const(ubyte*))message.ptr,
                        message.length, nonce.ptr,
                        bob_publickey.ptr, alice_secretkey.ptr) != 0) {
        assert(0);
    }

    ubyte[message.length] decrypted;
    if (crypto_box_open_easy(
            decrypted.ptr, ciphertext.ptr, ciphertext.length, nonce.ptr,
            alice_publickey.ptr, bob_secretkey.ptr) != 0) {
        assert(0);
    }
}
