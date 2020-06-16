#!/usr/bin/env node

const fs = require('fs');
const crypto = require('crypto');

// Read the hex-encoded secret key from the first command-line argument.
const secret = Buffer.from(process.argv[2], 'hex');

// Read the data to be decrypted from stdin.
const encryptedData = fs.readFileSync(0, 'utf-8').trim();

// Extract and decode the provided HMAC digest.
let [ data, providedDigest ] = encryptedData.split('--');
providedDigest = Buffer.from(providedDigest, 'hex');

// Calculate the digest ourselves.
const calculatedDigest = crypto.createHmac('sha1', secret).update(data).digest();

// Compare the provided and the calculated digests securely to ensure the
// encrypted data is authentic.
if (!crypto.timingSafeEqual(providedDigest, calculatedDigest)) {
	throw new Error('Invalid digest.');
}

// Split the encrypted data from the IV.
let [ ciphertext, iv ] = Buffer.from(data, 'base64').toString().split('--');
iv = Buffer.from(iv, 'base64');

// Decrypt the data using the secret and IV.
const decipher = crypto.createDecipheriv('aes256', secret, iv);
const plaintext = decipher.update(ciphertext, 'base64', 'utf-8') + decipher.final('utf-8');

console.log(plaintext);
