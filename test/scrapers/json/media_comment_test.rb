require 'test_helper'

class InstaScraper::JSON::MediaCommentTest < Minitest::Test
  def test_it_raises_when_no_arguments
    assert_raises ArgumentError do
      InstaScraper::JSON::MediaComment.new
    end
  end

  def test_account_url
    @media_comment = InstaScraper::JSON::MediaComment.new('BLeceL9BZNT', 17843235427151917, 20)

    assert @media_comment.url == 'https://www.instagram.com/query/?q=ig_shortcode(BLeceL9BZNT){comments.before(17843235427151917,20){count,nodes{id,created_at,text,user{id,profile_pic_url,username,follows{count},followed_by{count},biography,full_name,media{count},is_private,external_url,is_verified}},page_info}}'
  end

  def test_json_is_a_hashie_mash
    @media_comment = InstaScraper::JSON::MediaComment.new('BLeceL9BZNT', 17843235427151917, 20)

    json_file_path = File.expand_path('../samples/media_comment.json', __FILE__)
    @json = File.read(json_file_path)

    @media_comment.instance_variable_set('@raw_json', @json)
    assert @media_comment.data.is_a? Hashie::Mash
  end

end
