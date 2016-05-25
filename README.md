# Tzinfo::I18n [![Build Status](https://travis-ci.org/getaroom/tzinfo-i18n.svg?branch=master)](https://travis-ci.org/getaroom/tzinfo-i18n)

This gem extends TZInfo with I18n capabilities.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tzinfo-i18n'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tzinfo-i18n

## Usage

### TZInfo::Timezone
    
#### #translated_identifier/#translated_name
Returns the translated IANA Timezone Identifier
        
``` ruby
tz = TZInfo::Timezone.get('America/Chicago')
=> #<TZInfo::DataTimezone: America/Chicago> 

I18n.with_locale(:'x-piglatin') { tz.translated_identifier }
=> "America-way/Icago-chay"

I18n.with_locale(:'x-piglatin') { tz.translated_name }
=> "America-way/Icago-chay"
```

#### #translated_friendly_identifier
Returns the translated IANA Timezone Identifier after formatting

``` ruby
tz = TZInfo::Timezone.get('America/New_York')
=> #<TZInfo::DataTimezone: America/New_York>

I18n.with_locale(:'x-piglatin') { tz.translated_friendly_identifier }
=> "America-way - Ew-nay Ork-yay"

I18n.with_locale(:'x-piglatin') { tz.translated_friendly_identifier(true) }
=> "Ew-nay Ork-yay"
```

### TZInfo::Country#translated_name
Returns a translation of the country name or the default

``` ruby
country = TZInfo::Country.get('US')
=> #<TZInfo::Country: US>

I18n.with_locale(:'x-piglatin') { country.translated_name }
=> "United-way Ates-stay"
```

### TZInfo::CountryTimezone

#### #translated_friendly_identifier
Same as `TZInfo::Timezone#translated_friendly_identifier`

``` ruby
country = TZInfo::Country.get('US')
=> #<TZInfo::Country: US>

country_tz = country.zone_info.select { |z| z.identifier == 'America/New_York' }.first
=> #<TZInfo::CountryTimezone: America/New_York>

I18n.with_locale(:'x-piglatin') { country_tz.translated_friendly_identifier }
=> "America-way - Ew-nay Ork-yay"
```

#### #translated_description
Returns a translation of the description or the default

``` ruby
country = TZInfo::Country.get('US')
=> #<TZInfo::Country: US>

country_tz = country.zone_info.select { |z| z.identifier == 'America/New_York' }.first
=> #<TZInfo::CountryTimezone: America/New_York>

I18n.with_locale(:'x-piglatin') { country_tz.translated_description }
=> "Eastern-way (ost-may areas-way)"
```

#### #translated_description_or_friendly_identifier
Returns a translation of the description if available or the translated friendly identifier

``` ruby
country = TZInfo::Country.get('US')
=> #<TZInfo::Country: US>

country_tz = country.zone_info.select { |z| z.identifier == 'America/New_York' }.first
=> #<TZInfo::CountryTimezone: America/New_York>

I18n.with_locale(:'x-piglatin') { country_tz.translated_description_or_friendly_identifier }
=> "Eastern-way (ost-may areas-way)"
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/getaroom/tzinfo-i18n.

Please ensure that rubocop and rspec run successfully and that any additions include specs.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

