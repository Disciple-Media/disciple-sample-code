require "bundler/setup"

require "active_support/message_encryptor"

def hex_to_bin(s)
  s.scan(/../).map { |x| x.hex.chr }.join
end

input = STDIN.read
key = hex_to_bin(ARGV[0])

print ActiveSupport::MessageEncryptor
  .new(key,
       cipher: "AES-256-CBC",
       digest: "SHA1",
       serializer: ActiveSupport::MessageEncryptor::NullSerializer)
  .encrypt_and_sign(input)
