require 'test_helper'

class InstaScraper::JSON::AccountTest < Minitest::Test
  def setup
    @account = InstaScraper::JSON::Account.new('barna.kovacs.codes')

    json_file_path = File.expand_path('../samples/account.json', __FILE__)
    @json = JSON.parse(File.read(json_file_path))
  end

  def test_it_raises_when_no_arguments
    assert_raises ArgumentError do
      InstaScraper::JSON::Account.new
    end
  end

  def test_account_url
    assert @account.url == 'https://www.instagram.com/barna.kovacs.codes/?__a=1'
  end

  def test_it_parses_json
    assert @account.data == @json
  end

  def test_json_is_a_hashie_mash
    assert @account.data.is_a? Hashie::Mash
  end
end
