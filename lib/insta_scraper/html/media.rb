module InstaScraper
  class HTML::Media < InstaScraper::HTML
    attr_reader :code

    def initialize(code = nil, html = nil)
      raise ArgumentError, 'Provide a code or html string' if !code && !html

      @code = code
      @html = html
    end

    def url
      "https://www.instagram.com/p/#{code}/"
    end

    def data
      @data ||=
        Hashie::Mash.new(::JSON.parse(shared_data))
                    .extend(Hashie::Extensions::DeepFetch)
                    .extend(Hashie::Extensions::DeepFind)
    end
  end
end
