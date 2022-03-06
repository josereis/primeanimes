require 'rails_helper'

RSpec.describe Episode, type: :model do
  before do
    create(:anime)
    create(:season, anime: Anime.first)
  end

  context 'with valid params' do
    let(:season) { Season.first }

    it 'is valid' do
      episode = build(:episode, season: season, release_date: season.release_date)
      expect(episode).to be_valid
    end
  end

  context 'with invalid params' do
    let(:season) { Season.first }

    it 'unseason' do
      episode = build(:episode, release_date: season.release_date)
      expect(episode).to be_invalid
    end

    it 'no release date' do
      episode = build(:episode, season: season)
      expect(episode).to be_invalid
    end

    it 'untitle' do
      episode = build(:episode, season: season, release_date: season.release_date, title: nil)
      expect(episode).to be_invalid
    end

    it 'with title less than 3 characters' do
      episode = build(:episode, season: season, release_date: season.release_date, title: 'Ed')
      expect(episode).to be_invalid
    end
  end
end
