# InstaScraper

Scrapes Instagram

## Warning: not official and not maintained

This repository is a fork of the original published ruby gem. The upstream repo - `benoitr/insta_scraper`, is also not the original
gem publisher (the original gem's repository is no longer available), so I can't attest to how well this repo tracks with the
published gem.

I am not maintaining this repo except as minimally as needed to make my apps work, which up until now has mostly been about dealing
better with Faraday. That being said, pull requests are welcome.

## Installation

This repo is *not* published in rubygems.org, and as such require installation from this Github repo.

Bundle supports this natively by adding this line to your application's Gemfile:

```ruby
gem 'insta_scraper', require: 'insta_scraper', git: 'https://github.com/guss77/insta_scraper'
```

And then execute:

    $ bundle

If you do not use bundler, you will likely need to clone this repo and build it locally using:

    $ gem build insta_scrapper.gemspec
    $ gem install insta_scrapper*.gem

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

* InstaScraper::JSON::MediaComment (deprecated, use MediaCommentStream)

```ruby
media_comment = InstaScraper::JSON::MediaComment.new('BLeceL9BZNT', 17843235427151917, 20)
# shortcode, last_comment_id, per_page

media_comment.data #=> #<Hashie::Mash...
media_comment.data['comments']['nodes'] #=> [#<Hashie::Mash created_at=1476385792.0 id="17843206063151917" text="Now we can get the golden ship!"
```

* InstaScraper::JSON::MediaCommentStream

```ruby
media_comments = InstaScraper::JSON::MediaCommentStream.new('BLeceL9BZNT', options = {})
# optional_hash = { last_comment_id: '17845167841178842', max_comments: 200, per_page: 20}

media_comments.data #=> #<Hashie::Mash...
media_comments.data['comments'] #=> [#<Hashie::Mash created_at=1476385792.0 id="17843206063151917" text="Now we can get the golden ship!"
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
