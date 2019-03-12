## Usage

`php encrypt.php KEY < plaintext.txt`

`php decrypt.php KEY < ciphertext.txt`

## Example

```bash
printf '{ id: "test" }' | php encrypt.php 'b9885b819dfffe68fa30c47fdd48c6f8d0ee900c2a523a8647b43240dc64c5ec' | php decrypt.php 'b9885b819dfffe68fa30c47fdd48c6f8d0ee900c2a523a8647b43240dc64c5ec'
```

## Dependencies

- https://github.com/paragonie/random_compat (PHP 5.x)
