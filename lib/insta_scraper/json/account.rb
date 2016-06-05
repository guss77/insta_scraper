module InstaScraper
  class JSON::Account < InstaScraper::JSON
    attr_reader :username

    def initialize(username)
      @username = username
    end

    def url
      "https://www.instagram.com/#{username}/?__a=1"
    end

    def data
      @data ||=
        Hashie::Mash.new(::JSON.parse(raw_json))
                    .extend(Hashie::Extensions::DeepFetch)
                    .extend(Hashie::Extensions::DeepFind)
    end
  end
end
