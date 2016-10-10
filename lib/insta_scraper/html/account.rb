module InstaScraper
  class HTML::Account < InstaScraper::HTML
    attr_reader :username,
                :params

    def initialize(username = nil, html = nil, params = {})
      raise ArgumentError, 'Provide a username or html string' if !username && !html

      @username = username
      @html = html
      @params = params
    end

    def url
      "https://www.instagram.com/#{username}/#{serialize_params}"
    end

    def data
      @data ||=
        Hashie::Mash.new(::JSON.parse(shared_data))
                    .extend(Hashie::Extensions::DeepFetch)
                    .extend(Hashie::Extensions::DeepFind)
    end
  end
end
