require 'test_helper'

class InstaScraper::HTML::MediaTest < Minitest::Test
  def setup
    html_file_path = File.expand_path('../samples/media.html', __FILE__)
    @html = File.read(html_file_path)

    @media = InstaScraper::HTML::Media.new('BGFVAPPIaBQ', @html)

    json_file_path = File.expand_path('../samples/media.json', __FILE__)
    @json = JSON.parse(File.read(json_file_path))
  end

  def test_it_raises_when_no_arguments
    assert_raises ArgumentError do
      InstaScraper::HTML::Media.new
    end
  end

  def test_account_url
    assert @media.url == 'https://www.instagram.com/p/BGFVAPPIaBQ/'
  end

  def test_it_returns_the_init_html
    assert @media.html == @html
  end

  def test_it_parses_sharedData_raw_json
    assert @media.json == @json
  end

  def test_json_is_a_hashie_mash
    assert @media.json.is_a? Hashie::Mash
  end
end
