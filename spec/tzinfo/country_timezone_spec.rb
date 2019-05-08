# frozen_string_literal: true

module TZInfo
  RSpec.describe CountryTimezone do
    before do
      ::I18n.available_locales = %i[en x-piglatin]
      ::I18n.locale = locale
    end

    let(:country_code) { 'US' }
    let(:identifier) { 'America/New_York' }
    let(:country_timezone) do
      TZInfo::Country.get(country_code)
                     .zone_info.select { |z| z.identifier == identifier }.first
    end

    describe '#translated_description' do
      subject { country_timezone.translated_description }

      context 'x-piglatin' do
        let(:locale) { 'x-piglatin' }

        it { is_expected.to eql 'Eastern-way Ime-tay' }
        it { is_expected.not_to match(/translation missing/) }
      end

      context 'en' do
        let(:locale) { 'en' }

        it { is_expected.to match(/Eastern (Time|\(most areas\))/) }
        it { is_expected.not_to match(/translation missing/) }
      end
    end

    describe '#translated_friendly_identifier' do
      subject { country_timezone.translated_friendly_identifier }

      context 'x-piglatin' do
        let(:locale) { 'x-piglatin' }

        it { is_expected.to eql 'America-way - Ew-nay Ork-yay' }
        it { is_expected.not_to match(/translation missing/) }
      end

      context 'en' do
        let(:locale) { 'en' }

        it { is_expected.to eql 'America - New York' }
        it { is_expected.not_to match(/translation missing/) }
      end
    end

    describe '#translated_description_or_friendly_identifier' do
      subject { country_timezone.translated_description_or_friendly_identifier }

      context 'x-piglatin' do
        let(:locale) { 'x-piglatin' }

        it { is_expected.to eql 'Eastern-way Ime-tay' }
        it { is_expected.not_to match(/translation missing/) }
      end

      context 'en' do
        let(:locale) { 'en' }

        it { is_expected.to match(/Eastern (Time|\(most areas\))/) }
        it { is_expected.not_to match(/translation missing/) }
      end
    end
  end
end
