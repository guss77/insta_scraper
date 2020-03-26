require 'insta_scraper/version'

require 'open-uri'
require 'faraday'
require 'faraday-cookie_jar'
require 'json'

require 'hashie'

require 'insta_scraper/html'
require 'insta_scraper/html/account'
require 'insta_scraper/html/media'

require 'insta_scraper/json'
require 'insta_scraper/json/account'
require 'insta_scraper/json/media'
require 'insta_scraper/json/account_media'
require 'insta_scraper/json/media_comment'
require 'insta_scraper/json/media_comment_stream'

# configure Faraday with sensible defaults that make sense for a scrappper
Faraday.default_connection.adapter Faraday.default_adapter
Faraday.default_connection.use :cookie_jar
Faraday.use Faraday::Response::RaiseError # we'd want to catch these errors and propagate logical exceptions
