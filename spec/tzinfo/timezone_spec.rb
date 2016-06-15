module TZInfo
  RSpec.describe Timezone do
    before do
      ::I18n.available_locales = [:en, :'x-piglatin']
      ::I18n.locale = locale
    end

    let(:timezone) { 'America/New_York' }
    let(:tz) { TZInfo::Timezone.get(timezone) }

    describe '#translated_identifier' do
      subject { tz.translated_identifier }

      context 'x-piglatin' do
        let(:locale) { 'x-piglatin' }

        it { is_expected.to eql('America-way/Ew-nay Ork-yay') }
        it { is_expected.not_to match(/translation missing/) }
      end

      context 'en' do
        let(:locale) { 'en' }

        it { is_expected.to eql('America/New York') }
        it { is_expected.not_to match(/translation missing/) }
      end
    end

    describe '#translated_friendly_identifier' do
      subject { tz.translated_friendly_identifier }

      context 'x-piglatin' do
        let(:locale) { 'x-piglatin' }

        it { is_expected.to eql 'America-way - Ew-nay Ork-yay' }
        it { is_expected.not_to match(/translation missing/) }

        context 'skip_first_part is true' do
          subject { tz.translated_friendly_identifier(true) }

          it { is_expected.to eql 'Ew-nay Ork-yay' }
          it { is_expected.not_to match(/translation missing/) }
        end
      end

      context 'en' do
        let(:locale) { 'en' }

        it { is_expected.to eql('America - New York') }
        it { is_expected.not_to match(/translation missing/) }

        context 'skip_first_part is true' do
          subject { tz.translated_friendly_identifier(true) }

          it { is_expected.to eql 'New York' }
          it { is_expected.not_to match(/translation missing/) }
        end
      end
    end
  end
end
