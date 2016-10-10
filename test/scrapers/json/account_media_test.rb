require 'test_helper'

class InstaScraper::JSON::AccountMediaTest < Minitest::Test
  def test_it_raises_when_no_arguments
    assert_raises ArgumentError do
      InstaScraper::JSON::AccountMedia.new
    end
  end

  def test_account_url
    @account_media = InstaScraper::JSON::AccountMedia.new('barna.kovacs.codes')

    assert @account_media.url == 'https://www.instagram.com/barna.kovacs.codes/media/'
  end

  def test_json_is_a_hashie_mash
    @account_media = InstaScraper::JSON::AccountMedia.new('barna.kovacs.codes')

    json_file_path = File.expand_path('../samples/account_media.json', __FILE__)
    @json = File.read(json_file_path)

    @account_media.instance_variable_set('@raw_json', @json)
    assert @account_media.data.is_a? Hashie::Mash
  end

  def test_it_serializes_max_id_param
    @account_media = InstaScraper::JSON::AccountMedia.new('barna.kovacs.codes', max_id: '1329031062285749945_528817151')

    assert @account_media.url == 'https://www.instagram.com/barna.kovacs.codes/media/?max_id=1329031062285749945_528817151'
  end
end
