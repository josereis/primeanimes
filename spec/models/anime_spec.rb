require 'rails_helper'

RSpec.describe Anime, type: :model do
  context 'with valid params' do
    let(:anime) { build(:anime) }

    it 'no finish date' do
      expect(anime).to be_valid
      expect(anime).to validate_attached_of(:photo)
    end

    it 'with finish date' do
      anime = build(:anime, :with_finish_date)
      expect(anime).to be_valid
    end
  end

  context 'with invalid params' do
    it 'no photo' do
      anime = build(:anime)
      anime.photo = nil
      expect(anime).to be_invalid
    end

    it 'untitle' do
      anime = build(:anime, title: '')
      expect(anime).to be_invalid
    end

    it 'with title less than 3 characters' do
      anime = build(:anime, title: 'Na')
      expect(anime).to be_invalid
    end

    it 'with status not present' do
      anime = build(:anime, status: nil)
      expect(anime).to be_invalid
    end

    it 'with value not included in user status' do
      anime = build(:anime, status: 'removed')
      expect(anime).to be_invalid
    end

    it 'with release date not present' do
      anime = build(:anime, release_date: nil)
      expect(anime).to be_invalid
    end

    it 'with future release date' do
      anime = build(:anime, release_date: (Date.today+2.day))
      expect(anime).to be_invalid
    end

    it 'with future finish date' do
      anime = build(:anime, finish_date: (Date.today+2.day))
      expect(anime).to be_invalid
    end
  end
end
