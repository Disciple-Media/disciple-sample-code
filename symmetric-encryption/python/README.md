## Usage

`python3 encrypt.py KEY < plaintext.txt`

`python3 decrypt.py KEY < ciphertext.txt`

## Example

```bash
printf '{ "id": "test" }' | python3 encrypt.py 'b9885b819dfffe68fa30c47fdd48c6f8d0ee900c2a523a8647b43240dc64c5ec' | python3 decrypt.py 'b9885b819dfffe68fa30c47fdd48c6f8d0ee900c2a523a8647b43240dc64c5ec'
```
