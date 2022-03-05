require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe "Validations" do
    let(:admin) { build(:admin) }

    it 'is valid' do
      expect(admin).to be_valid
    end

    it 'it is not valid, without a email' do
      admin.email = nil
      expect(admin).to_not be_valid
    end

    it 'it is not valid, without a password' do
      admin.password = nil
      expect(admin).to_not be_valid
    end

    it 'it is not valid, without a name' do
      admin.name = nil
      expect(admin).to_not be_valid
    end

    it 'it is not valid with name shorter than 3 characters' do
      admin.name = 'Ad'
      expect(admin).to_not be_valid
    end
  end
end
