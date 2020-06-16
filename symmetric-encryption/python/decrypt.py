#!/usr/bin/env python3

import sys
import hmac
import base64
import binascii

from Cryptodome.Cipher import AES
from Cryptodome.Util.Padding import unpad

if __name__ == '__main__':
	# Read the hex-encoded secret key from the first command-line argument.
	key = binascii.unhexlify(sys.argv[1])

	# Read the data to be decrypted from stdin.
	auth_data = sys.stdin.buffer.read().strip()

	# Extract and decode the provided HMAC digest.
	data, provided_hmac = auth_data.split(b'--')

	# Calculate the digest ourselves.
	calculated_hmac = binascii.hexlify(hmac.digest(key, data, 'sha1'))

	# Compare the provided and the calculated digests securely to ensure the
	# encrypted data is authentic.
	hmac_check = hmac.compare_digest(provided_hmac, calculated_hmac)
	if not hmac_check:
		raise Exception('Failed HMAC check')

	# Split the encrypted data from the IV.
	ciphertext, iv = base64.b64decode(data).split(b'--')

	# Decrypt the data using the secret and IV.
	cipher = AES.new(key, AES.MODE_CBC, iv=base64.b64decode(iv))
	plaintext = unpad(cipher.decrypt(base64.b64decode(ciphertext)), AES.block_size)

	print(plaintext)
