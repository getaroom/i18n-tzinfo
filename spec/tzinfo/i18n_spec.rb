module TZInfo
  RSpec.describe I18n do
    it 'has a version number' do
      expect(TZInfo::I18n::VERSION).not_to be nil
    end

    it 'has CONFIG_PATH' do
      expect(TZInfo::I18n::CONFIG_PATH).not_to be nil
    end
  end
end
