require 'rails_helper'

RSpec.describe Season, type: :model do
  before {create(:anime)}

  context 'with valid params' do
    let(:season) { build(:season, anime: Anime.first) }
    
    it 'is valid' do
      expect(season).to be_valid
    end

    it 'is valid with finish date' do
      other_season = build(:season, :with_finish_date, anime: season.anime, number: season.number+1)

      expect(other_season).to be_valid
    end
  end

  context 'with valid params' do
    let(:anime) { Anime.first }

    it 'no anime' do
      season = build(:season)
      expect(season).to be_invalid
    end

    it 'no number' do
      season = build(:season, anime: anime, number: nil)
      expect(season).to be_invalid
    end

    it 'with future release date' do
      season = build(:season, anime: anime, release_date: (Date.today+2.day))
      expect(season).to be_invalid
    end

    it 'with future finish date' do
      season = build(:season, anime: anime, finish_date: (Date.today+2.day))
      expect(season).to be_invalid
    end
  end
end
