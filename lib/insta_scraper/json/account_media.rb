module InstaScraper
  class JSON::AccountMedia < InstaScraper::JSON
    attr_reader :username

    def initialize(username)
      @username = username
    end

    def url
      "https://www.instagram.com/#{username}/media/"
    end

    def json
      @json ||=
        Hashie::Mash.new(::JSON.parse(raw_json))
                    .extend(Hashie::Extensions::DeepFetch)
                    .extend(Hashie::Extensions::DeepFind)
    end
  end
end
