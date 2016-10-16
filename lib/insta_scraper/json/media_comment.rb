module InstaScraper
  class JSON::MediaComment < InstaScraper::JSON
    attr_reader :shortcode,
                :last_comment_id,
                :per_page

    def initialize(shortcode, last_comment_id, per_page = 20)
      @shortcode       = shortcode
      @last_comment_id = last_comment_id
      @per_page        = per_page
    end

    def url
      "https://www.instagram.com/query/?q=ig_shortcode(#{shortcode}){comments.before(#{last_comment_id},#{per_page}){count,nodes{id,created_at,text,user{id,profile_pic_url,username,follows{count},followed_by{count},biography,full_name,media{count},is_private,external_url,is_verified}},page_info}}"
    end
  end
end
