module InstaScraper
  class JSON::Media < InstaScraper::JSON
    attr_reader :code

    def initialize(code)
      @code = code
    end

    def url
      "https://www.instagram.com/p/#{code}/?__a=1"
    end

    def data
      @data ||=
        Hashie::Mash.new(::JSON.parse(raw_json))
                    .extend(Hashie::Extensions::DeepFetch)
                    .extend(Hashie::Extensions::DeepFind)
    end
  end
end
