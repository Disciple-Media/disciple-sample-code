def ruby_encrypt(data, key)
  encrypted_data, = Open3.capture2(
    { "BUNDLE_GEMFILE" => "ruby/Gemfile" },
    "ruby",
    "ruby/encrypt.rb",
    key,
    stdin_data: data
  )
  encrypted_data
end

def ruby_decrypt(data, key)
  decrypted_data, = Open3.capture2(
    { "BUNDLE_GEMFILE" => "ruby/Gemfile" },
    "ruby",
    "ruby/decrypt.rb",
    key,
    stdin_data: data
  )
  decrypted_data
end

def php_encrypt(data, key)
  decrypted_data, = Open3.capture2(
    "php",
    "php/encrypt.php",
    key,
    stdin_data: data
  )
  decrypted_data
end

def php_decrypt(data, key)
  decrypted_data, = Open3.capture2(
    "php",
    "php/decrypt.php",
    key,
    stdin_data: data
  )
  decrypted_data
end
