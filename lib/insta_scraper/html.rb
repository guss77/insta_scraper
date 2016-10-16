module InstaScraper
  class HTML
    def html
      @html ||= get_html
    end

    def data
      @data ||=
        Hashie::Mash.new(::JSON.parse(shared_data))
                    .extend(Hashie::Extensions::DeepFetch)
                    .extend(Hashie::Extensions::DeepFind)
    end

    protected

    def serialize_params
      return '' if params.empty?

      "?" + params.map {|k, v| "#{k}=#{v}"}.join('&')
    end

    private

    def get_html
      open(url).read
    end

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
