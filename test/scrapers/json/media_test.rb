require 'test_helper'

class InstaScraper::JSON::MediaTest < Minitest::Test
  def setup
    @media = InstaScraper::JSON::Media.new('BF4Lh2vIaBi')

    json_file_path = File.expand_path('../samples/media.json', __FILE__)
    @json = File.read(json_file_path)
  end

  def test_it_raises_when_no_arguments
    assert_raises ArgumentError do
      InstaScraper::JSON::Media.new
    end
  end

  def test_media_url
    assert @media.url == 'https://www.instagram.com/p/BF4Lh2vIaBi/?__a=1'
  end

  def test_json_is_a_hashie_mash
    @media.instance_variable_set('@raw_json', @json)
    assert @media.data.is_a? Hashie::Mash
  end
end
