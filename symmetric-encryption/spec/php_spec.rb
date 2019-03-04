require "spec_helper"

RSpec.describe "PHP" do
  let(:value) { "secret" }
  let(:key) { SecureRandom.hex(32) }

  it "can decrypt values encrypted by itself" do
    expect(php_decrypt(php_encrypt(value, key), key)).to eq(value)
  end

  it "can decrypt values encrypted by Ruby" do
    expect(php_decrypt(ruby_encrypt(value, key), key)).to eq(value)
  end
end
