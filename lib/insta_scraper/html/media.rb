module InstaScraper
  class HTML::Media < InstaScraper::HTML
    attr_reader :code,
                :params

    def initialize(code = nil, html = nil, params = {})
      raise ArgumentError, 'Provide a code or html string' if !code && !html

      @code = code
      @html = html
      @params = params
    end

    def url
      "https://www.instagram.com/p/#{code}/#{serialize_params}"
    end

    def data
      @data ||=
        Hashie::Mash.new(::JSON.parse(shared_data))
                    .extend(Hashie::Extensions::DeepFetch)
                    .extend(Hashie::Extensions::DeepFind)
    end
  end
end
