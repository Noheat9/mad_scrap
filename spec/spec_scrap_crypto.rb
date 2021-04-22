require_relative '../lib/scrap_crypto'

describe "the crypto_name method" do
  it "should return an array" do
    expect(crypto_name).to be_instance_of Array
  end
end

describe "the crypto_price method" do
  it "should return an array" do
    expect(crypto_price).to be_instance_of Array
  end
end