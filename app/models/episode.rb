class Episode < ApplicationRecord
  belongs_to :season

  validates_associated :season
  validates :number, :release_date, presence: true
  validates :title, presence: true, length: { minimum: 3 }
  validates :number, uniqueness: { scope: :season_id, message: "deve ser único para a temporada" }

  scope :with_title, -> (title) { where("animes.title ilike '#{title}%'") }
end
