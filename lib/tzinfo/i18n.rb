# frozen_string_literal: true

require 'tzinfo'
require 'tzinfo/i18n/version'
require 'i18n'

module TZInfo
  module I18n
    CONFIG_PATH = File.expand_path(
      File.join(File.dirname(__FILE__), '..', '..', 'config')
    ).freeze
  end

  class Timezone
    def translated_identifier
      identifier.split('/').map do |v|
        ::I18n.t(v, scope: 'iana_timezones', default: v.tr('_', ' '))
      end.join('/')
    end

    # rubocop:disable all
    def translated_friendly_identifier(skip_first_part = false)
      parts = translated_identifier.split('/')
      if parts.empty?
        # shouldn't happen
        identifier
      elsif parts.length == 1
        parts[0]
      else
        if skip_first_part
          result = +''
        else
          result = parts[0] + ' - '
        end

        parts[1, parts.length - 1].reverse_each {|part|
          part.gsub!(/_/, ' ')

          if part.index(/[a-z]/)
            # Missing a space if a lower case followed by an upper case and the
            # name isn't McXxxx.
            part.gsub!(/([^M][a-z])([A-Z])/, '\1 \2')
            part.gsub!(/([M][a-bd-z])([A-Z])/, '\1 \2')

            # Missing an apostrophe if two consecutive upper case characters.
            part.gsub!(/([A-Z])([A-Z])/, '\1\'\2')
          end

          result << part
          result << ', '
        }

        result.slice!(result.length - 2, 2)
        result
      end
    end
    # rubocop:enable all

    alias translated_name :translated_identifier
  end

  class Country
    def translated_name
      ::I18n.t(name, scope: 'country_names', default: name)
    end
  end

  class CountryTimezone
    def translated_description_or_friendly_identifier
      if description
        translated_description
      else
        translated_friendly_identifier
      end
    end

    def translated_description
      ::I18n.t(identifier, scope: 'timezone_description', default: description)
    end

    def translated_friendly_identifier
      Timezone.get(identifier).translated_friendly_identifier
    end
  end
end

I18n.load_path.concat(
  Dir[File.join(TZInfo::I18n::CONFIG_PATH, 'locales', '*.yml')]
)

# English must be in the available locales for everything to work correctly
I18n.available_locales += [:en]
