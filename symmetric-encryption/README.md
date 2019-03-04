# Disciple Shared Key Encryption

This repository contains code to encrypt and decrypt data with a
secret key.

## Encryption

AES-256-CBC, HMAC-SHA1, Encrypt-then-MAC

1. Generate a random IV
2. Encrypt the plaintext using the key and IV
3. Concatenate Base64 encoded ciphertext with Base64 encoded IV (separator: `--`) and Base64 encode the result
4. Generate a HMAC digest of the encrypted data
5. Concatenate the result of step 3 with the result of step 4 (separator: `--`)

## Decryption

1. Split the input on separator `--` to receive the data and HMAC digest
2. Generate a HMAC digest of the data and verify both digests match
   (**IMPORTANT**: Use constant time string comparison to guard
   against timing attacks!)
3. Base64 decode the data and split on separator `--` to receive the ciphertext and the IV
4. Decrypt the ciphertext using the key and IV (please remember that
   the ciphertext and IV are Base64 encoded and might have to be
   decoded before decryption)
