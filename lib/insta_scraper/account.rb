module InstaScraper
  class Account
    attr_reader :username,
                :html

    def initialize(username = nil, html = nil)
      raise ArgumentError, 'Provide a username or html string' if !username && !html
    end
  end
end
