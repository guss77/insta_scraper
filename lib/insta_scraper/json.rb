module InstaScraper
  class JSON
    def raw_json
      @raw_json ||= get_json
    end

    private

    def get_json
      open(url).read
    end
  end
end
