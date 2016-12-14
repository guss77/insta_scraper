module InstaScraper

  class JSON::MediaCommentStream < InstaScraper::JSON
    attr_reader :shortcode,
                :last_comment_id,
                :per_page,
                :max_comments,
                :responses,
                :comments,
                :error

    def initialize(shortcode, options = {})#, last_comment_id = nil, max_comments = nil, per_page = 20)
      @shortcode       = shortcode
      @last_comment_id = options[:last_comment_id] || nil
      @per_page        = options[:per_page] || 20
      @max_comments    = options[:max_comments] || nil
      @responses       = {}
      @comments        = {}
    end

    def data(current_last_comment_id = nil)
      current_last_comment_id ||= (last_comment_id || default_last_comment_id)

      response = connection.post do |req|
        req.url '/query/'
        #req.headers['Content-Type'] = 'application/json'
        req.headers['content-type'] = 'application/x-www-form-urlencoded'
        req.headers['X-CSRFToken'] = csrf_token
        req.headers['Referer'] = "https://www.instagram.com/#{shortcode}/"
        req.headers['x-instagram-ajax'] = '1'
        req.headers['x-requested-with'] = 'XMLHttpRequest'
        req.body = "q=ig_shortcode(#{shortcode}){comments.before(#{current_last_comment_id},#{per_page}){count,nodes{id,created_at,text,user{id,profile_pic_url,username,follows{count},followed_by{count},biography,full_name,media{count},is_private,external_url,is_verified}},page_info}}"
      end

      current_comments = ::JSON.parse(response.body)['comments']['nodes']

      @responses[current_last_comment_id] = response
      @comments[current_last_comment_id] = current_comments

      if current_comments.any? && !reached_max_comments?
        data(current_comments.first['id'])
      end

      all_comments
    rescue => e
      warn e.inspect
      @error = e
      all_comments
    end

    private

    def all_comments
      comments.values.flatten
    end

    def reached_max_comments?
      return false unless max_comments

      all_comments.count > max_comments
    end

    def connection
      @connection ||= Faraday.new(:url => "https://www.instagram.com/") do |builder|
        builder.use :cookie_jar
        builder.adapter Faraday.default_adapter
      end
    end

    def connection_response
      @connection_response ||= connection.get "/p/#{shortcode}/?__a=1"
    end

    def csrf_token
      connection_response.headers["set-cookie"].match(%r{csrftoken=(?<token>\w+);})['token']
    end

    def default_last_comment_id
      media = InstaScraper::JSON::Media.new(shortcode)
      media.response = connection_response
      media.data['media']['comments']['nodes'].last['id']
    end
  end

end
