module InstaScraper
  class JSON::AccountMedia < InstaScraper::JSON
    attr_reader :username,
                :params

    def initialize(username, params = {})
      @username = username
      @params = params
    end

    def url
      "https://www.instagram.com/#{username}/media/#{serialize_params}"
    end

    def data
      @data ||=
        Hashie::Mash.new(::JSON.parse(raw_json))
                    .extend(Hashie::Extensions::DeepFetch)
                    .extend(Hashie::Extensions::DeepFind)
    end

    private

    def serialize_params
      return '' if params.empty?

      "?" + params.map {|k, v| "#{k}=#{v}"}.join('&')
    end
  end
end
