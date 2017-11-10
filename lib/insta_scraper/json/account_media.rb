module InstaScraper
  class JSON::AccountMedia < InstaScraper::JSON
    attr_reader :id, :per_page, :end_cursor

    def initialize(id:, per_page: 12, end_cursor: nil)
      @id = id
      @per_page = per_page
      @end_cursor = end_cursor
    end

    def variables
      if end_cursor
        "{\"id\":\"#{id}\",\"first\":#{per_page},\"after\":\"#{end_cursor}\"}"
      else
        "{\"id\":\"#{id}\",\"first\":#{per_page}}"
      end
    end

    def params
      {
        query_id: 17888483320059182,
        variables: variables,
      }
    end

    def url
      "https://www.instagram.com/graphql/query/#{serialize_params}"
    end
  end
end
