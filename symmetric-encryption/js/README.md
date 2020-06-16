## Usage

`node encrypt.js KEY < plaintext.txt`

`node decrypt.js KEY < ciphertext.txt`

## Example

```bash
printf '{ "id": "test" }' | node encrypt.js 'b9885b819dfffe68fa30c47fdd48c6f8d0ee900c2a523a8647b43240dc64c5ec' | node decrypt.js 'b9885b819dfffe68fa30c47fdd48c6f8d0ee900c2a523a8647b43240dc64c5ec'
```
