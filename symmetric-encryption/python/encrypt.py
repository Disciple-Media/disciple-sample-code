#!/usr/bin/env python3

import sys
import hmac
import base64
import binascii

from Cryptodome.Cipher import AES
from Cryptodome.Util.Padding import pad

if __name__ == '__main__':
	# Read the hex-encoded secret key from the first command-line argument.
	key = binascii.unhexlify(sys.argv[1])

	# Read the data to be encrypted from stdin.
	plaintext = sys.stdin.buffer.read()

	# Encrypt the data with AES.
	cipher = AES.new(key, AES.MODE_CBC)
	ct_bytes = cipher.encrypt(pad(plaintext, AES.block_size))
	ciphertext = base64.b64encode(ct_bytes)
	iv = base64.b64encode(cipher.iv)

	# Concatenate the encoded ciphertext, '--', and the IV, then encode as Base64.
	data = base64.b64encode(ciphertext + b'--' + iv)

	# Calculate the digest.
	digest = binascii.hexlify(hmac.digest(key, data, 'sha1'))

	# Concatenate the data and the digest then output it.
	print((data + b'--' + digest).decode('utf-8'))
