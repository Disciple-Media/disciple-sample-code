## Usage

`ruby encrypt.php KEY < plaintext.txt`

`ruby decrypt.php KEY < ciphertext.txt`

## Example

```bash
printf '{ id: "test" }' | ruby encrypt.rb 'b9885b819dfffe68fa30c47fdd48c6f8d0ee900c2a523a8647b43240dc64c5ec' | ruby decrypt.rb 'b9885b819dfffe68fa30c47fdd48c6f8d0ee900c2a523a8647b43240dc64c5ec'
```

## Dependencies

- ActiveSupport
