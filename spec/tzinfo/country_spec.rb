module TZInfo
  RSpec.describe Country do
    describe '#translated_identifier' do
      let(:country_code) { 'US' }
      let(:country) { TZInfo::Country.get(country_code) }

      subject { country.translated_name }

      before do
        ::I18n.available_locales = [:en, :'x-piglatin']
        ::I18n.locale = locale
      end

      context 'x-piglatin' do
        let(:locale) { 'x-piglatin' }

        it { is_expected.to eql('United-way Ates-stay') }
        it { is_expected.not_to match(/translation missing/) }
      end

      context 'en' do
        let(:locale) { 'en' }

        it { is_expected.to eql('United States') }
        it { is_expected.not_to match(/translation missing/) }
      end
    end
  end
end
