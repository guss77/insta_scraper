module InstaScraper
  class JSON::Account < InstaScraper::JSON
    attr_reader :username

    def initialize(username)
      @username = username
    end

    def url
      "https://www.instagram.com/#{username}/?__a=1"
    end
  end
end
