module InstaScraper
  class HTML::Account < InstaScraper::HTML
    attr_reader :username

    def initialize(username = nil, html = nil)
      raise ArgumentError, 'Provide a username or html string' if !username && !html

      @username = username
      @html = html
    end

    def url
      "https://www.instagram.com/#{username}/"
    end

    def json
      @json ||=
        Hashie::Mash.new(JSON.parse(shared_data))
                    .extend(Hashie::Extensions::DeepFetch)
                    .extend(Hashie::Extensions::DeepFind)
    end
  end
end
