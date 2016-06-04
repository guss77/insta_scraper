require 'test_helper'

class AccountTest < Minitest::Test
  def setup
    html = File.expand_path("../samples/account.html", __FILE__)
    @account = InstaScraper::Account.new('barna.kovacs.codes', html)
  end

  def test_it_raises_when_no_arguments
    assert_raises ArgumentError do
      InstaScraper::Account.new
    end
  end

  def test_account_url
    assert @account.url == 'https://www.instagram.com/barna.kovacs.codes/'
  end
end
