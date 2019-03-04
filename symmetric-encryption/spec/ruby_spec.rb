require "spec_helper"

RSpec.describe "Ruby" do
  let(:value) { "secret" }
  let(:key) { SecureRandom.hex(32) }

  it "can decrypt values encrypted by itself" do
    expect(ruby_decrypt(ruby_encrypt(value, key), key)).to eq(value)
  end

  it "can decrypt values encrypted by PHP" do
    expect(ruby_decrypt(php_encrypt(value, key), key)).to eq(value)
  end
end
