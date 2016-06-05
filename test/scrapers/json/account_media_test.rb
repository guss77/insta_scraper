require 'test_helper'

class InstaScraper::JSON::AccountMediaTest < Minitest::Test
  def setup
    @media = InstaScraper::JSON::AccountMedia.new('barna.kovacs.codes')

    json_file_path = File.expand_path('../samples/account_media.json', __FILE__)
    @json = JSON.parse(File.read(json_file_path))
  end

  def test_it_raises_when_no_arguments
    assert_raises ArgumentError do
      InstaScraper::HTML::Media.new
    end
  end

  def test_account_url
    assert @media.url == 'https://www.instagram.com/barna.kovacs.codes/media/'
  end

  def test_json_is_a_hashie_mash
    assert @media.data.is_a? Hashie::Mash
  end
end
