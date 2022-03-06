class Season < ApplicationRecord
  has_rich_text :description
  belongs_to :anime
  has_many :episodes, dependent: :destroy
  accepts_nested_attributes_for :episodes

  validates_associated :anime
  validates :number, :description, presence: true
  validates :number, uniqueness: { scope: :anime_id, message: "dese ser unico para o anime" }
  validates :release_date, presence: true, future_date: true
  validates :finish_date, future_date: true, if: proc { |t| t.finish_date.present? }

  scope :anime_seasons, -> (anime) { where(anime_id: anime) }
end
