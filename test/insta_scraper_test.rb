require 'test_helper'

class InstaScraperTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::InstaScraper::VERSION
  end
end
