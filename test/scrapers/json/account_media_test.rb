require 'test_helper'

class InstaScraper::JSON::AccountMediaTest < Minitest::Test
  def test_it_raises_when_no_arguments
    assert_raises ArgumentError do
      InstaScraper::JSON::AccountMedia.new
    end
  end

  def test_account_url
    @account_media = InstaScraper::JSON::AccountMedia.new(id: 25025320)

    assert @account_media.url ==
      'https://www.instagram.com/graphql/query/?query_id=17888483320059182&variables={"id":"25025320","first":12}'
  end

  def test_json_is_a_hashie_mash
    @account_media = InstaScraper::JSON::AccountMedia.new(id: 25025320)

    json_file_path = File.expand_path('../samples/account_media.json', __FILE__)
    @json = File.read(json_file_path)

    @account_media.instance_variable_set('@raw_json', @json)
    assert @account_media.data.is_a? Hashie::Mash
  end
end
