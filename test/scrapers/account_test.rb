require 'test_helper'

class AccountTest < Minitest::Test
  def setup
    html_file_path = File.expand_path("../../samples/account.html", __FILE__)
    @html = File.read(html_file_path)

    @account = InstaScraper::Account.new('barna.kovacs.codes', @html)
  end

  def test_it_raises_when_no_arguments
    assert_raises ArgumentError do
      InstaScraper::Account.new
    end
  end

  def test_account_url
    assert @account.url == 'https://www.instagram.com/barna.kovacs.codes/'
  end

  def test_it_returns_html
    assert @account.html == @html
  end
end
