# InstaScraper

Scrapes Instagram

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'insta_scraper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install insta_scraper

## Usage

Subclasses of InstaScraper::HTML are scraping html endpoints.
Subclasses of InstaScraper::JSON are scraping json endpoints.

* InstaScraper::HTML::Account

```ruby
account = InstaScraper::HTML::Account.new('barna.kovacs.codes')

account.data #=> #<Hashie::Mash...
account.data.deep_find('followed_by').fetch('count') #=> 4
```

* InstaScraper::HTML::Media

```ruby
media = InstaScraper::HTML::Media.new('BGFVAPPIaBQ')

media.data #=> #<Hashie::Mash...
media.data.deep_find('comments').fetch('count') #=> 1892
```

* InstaScraper::JSON::Account

```ruby
account = InstaScraper::JSON::Account.new('barna.kovacs.codes')

account.data #=> #<Hashie::Mash...
account.data.deep_find('followed_by').fetch('count') #=> 4
```

* InstaScraper::JSON::Media

```ruby
media = InstaScraper::JSON::Media.new('BGFVAPPIaBQ')

media.data #=> #<Hashie::Mash...
media.data.deep_find('comments').fetch('count') #=> 1892
```

* InstaScraper::JSON::AccountMedia

```ruby
account_media = InstaScraper::JSON::AccountMedia.new('barna.kovacs.codes')
# or with params (ex. max_id for offset)
# account_media = InstaScraper::JSON::AccountMedia.new('barna.kovacs.codes', max_id: '1261002980537663713_3072962559')

account_media.data #=> #<Hashie::Mash...
account_media.data.fetch('items') #=> [...]
```

* InstaScraper::JSON::MediaComment

```ruby
media_comment = InstaScraper::JSON::MediaComment.new('BLeceL9BZNT', 17843235427151917, 20)
# shortcode, last_comment_id, per_page

media_comment.data #=> #<Hashie::Mash...
media_comment.data['comments']['nodes'] #=> [#<Hashie::Mash created_at=1476385792.0 id="17843206063151917" text="Now we can get the golden ship!"
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/preciz/insta_scraper.

Ferenc Fekete
Extended gem with comment crawler class.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
