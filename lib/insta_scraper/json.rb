module InstaScraper
  class JSON
    def raw_json
      @raw_json ||= response.body
    end

    def data
      @data ||=
        Hashie::Mash.new(::JSON.parse(raw_json))
                    .extend(Hashie::Extensions::DeepFetch)
                    .extend(Hashie::Extensions::DeepFind)
    end

    attr_writer :response

    def response
      @response ||= Faraday.get(url)
    end

    protected

    def serialize_params
      return '' if params.empty?

      "?" + params.map {|k, v| "#{k}=#{v}"}.join('&')
    end
  end
end
