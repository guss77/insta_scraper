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

    private

    def line_with_data
      html.each_line.detect { |l| l[/sharedData/] }
    end

    def shared_data
      line_with_data[shared_data_start..shared_data_end]
    end

    def shared_data_start
      (line_with_data =~ /sharedData/) + 13
    end

    def shared_data_end
      line_with_data =~ /\};</
    end
  end
end
