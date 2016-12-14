require 'test_helper'

class InstaScraper::JSON::MediaCommentStreamTest < Minitest::Test
  def test_it_raises_when_no_arguments
    assert_raises ArgumentError do
      InstaScraper::JSON::MediaCommentStream.new
    end
  end

end
