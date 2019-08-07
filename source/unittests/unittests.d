module unittests;

import libsodium;

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
