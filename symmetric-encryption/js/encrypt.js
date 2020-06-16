#!/usr/bin/env node

const fs = require('fs');
const crypto = require('crypto');

// Read the hex-encoded secret key from the first command-line argument.
const secret = Buffer.from(process.argv[2], 'hex');

// Generate a random IV.
const iv = crypto.randomBytes(16);

// Read the data to be encrypted from stdin.
const info = fs.readFileSync(0, 'utf-8');

// Encrypt the data with AES.
const cipher = crypto.createCipheriv('aes256', secret, iv);
const encrypted = cipher.update(info, 'binary', 'base64') + cipher.final('base64');
const encodedIV = Buffer.from(iv).toString('base64');

// Concatenate the encoded ciphertext, '--', and the IV, then encode as Base64.
data = Buffer.from(`${ encrypted }--${ encodedIV }`).toString('base64');

// Calculate the digest.
const digest = crypto.createHmac('sha1', secret).update(data).digest('hex');

// Concatenate the data and the digest then output it.
console.log(`${data}--${digest}`);
