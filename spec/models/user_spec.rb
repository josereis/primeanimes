require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:otaku) { build(:user) }
  let!(:admin) { build(:user, :admin) }

  context 'with valid parameters' do
    it 'with user valid' do
      expect(otaku).to be_valid
      expect(admin).to be_valid
    end

    it 'is a otaku user and status is true' do
      expect(otaku.status.active?).to eq(true)
      expect(otaku.profile.otaku?).to eq(true)
    end

    it 'is a secretary user and status is true' do
      expect(admin.status.active?).to eq(true)
      expect(admin.profile.admin?).to eq(true)
    end
  end

  context 'with not valid parameters' do
    it 'unnamed' do
      otaku.name = ""
      expect(otaku).to_not be_valid
    end

    it 'name less than 3 characters' do
      otaku.name = "Ot"
      expect(otaku).to_not be_valid
    end

    it 'status not present' do
      otaku.status = nil
      expect(otaku).to_not be_valid
    end

    it 'value not included in user status' do
      otaku.status = 'removed'
      expect(otaku).to_not be_valid
    end

    it 'profile not present' do
      otaku.profile = nil
      expect(otaku).to_not be_valid
    end

    it 'value not included in user profile' do
      otaku.profile = 'common'
      expect(otaku).to_not be_valid
    end
  end
end
