module InstaScraper
  class JSON::AccountMedia < InstaScraper::JSON
    attr_reader :username,
                :params

    def initialize(username, params = {})
      @username = username
      @params = params
    end

    def url
      "https://www.instagram.com/#{username}/media/#{serialize_params}"
    end
  end
end
