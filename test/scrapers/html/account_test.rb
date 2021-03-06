require 'test_helper'

class InstaScraper::HTML::AccountTest < Minitest::Test
  def setup
    html_file_path = File.expand_path('../samples/account.html', __FILE__)
    @html = File.read(html_file_path)

    @account = InstaScraper::HTML::Account.new('barna.kovacs.codes', @html)

    json_file_path = File.expand_path('../samples/account.json', __FILE__)
    @json = JSON.parse(File.read(json_file_path))
  end

  def test_it_raises_when_no_arguments
    assert_raises ArgumentError do
      InstaScraper::HTML::Account.new
    end
  end

  def test_account_url
    assert @account.url == 'https://www.instagram.com/barna.kovacs.codes/'
  end

  def test_it_returns_the_init_html
    assert @account.html == @html
  end

  def test_it_parses_sharedData_raw_json
    assert @account.data == @json
  end

  def test_json_is_a_hashie_mash
    assert @account.data.is_a? Hashie::Mash
  end

  def test_it_serializes_max_id_param
    @account = InstaScraper::HTML::Account.new('barna.kovacs.codes', nil, max_id: '1329031062285749945_528817151')

    assert @account.url == 'https://www.instagram.com/barna.kovacs.codes/?max_id=1329031062285749945_528817151'
  end
end
