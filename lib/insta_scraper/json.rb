module InstaScraper
  class JSON
    def raw_json
      @raw_json ||= get_json
    end

    def data
      @data ||=
        Hashie::Mash.new(::JSON.parse(raw_json))
                    .extend(Hashie::Extensions::DeepFetch)
                    .extend(Hashie::Extensions::DeepFind)
    end

    protected

    def serialize_params
      return '' if params.empty?

      "?" + params.map {|k, v| "#{k}=#{v}"}.join('&')
    end

    private

    def get_json
      open(url).read
    end
  end
end
