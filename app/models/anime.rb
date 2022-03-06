class Anime < ApplicationRecord
  extend Enumerize

  has_one_attached :photo
  has_rich_text :synopsis
  has_many :season, dependent: :destroy

  enumerize :status, in: %i[in_progress stopped complete], scope: true, predicates: true

  validates :status, :synopsis, presence: true
  validates_inclusion_of :status, in: Anime.status.values
  validates :release_date, presence: true, future_date: true
  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3 }
  validates :finish_date, future_date: true, if: proc { |t| t.finish_date.present? }
  validates :photo, attached: true, content_type: [:png, :jpg, :jpeg]

  scope :with_title, -> (title) { where("animes.title ilike '#{title}%'") }
  scope :with_status, -> (statuses) { where(status: statuses) }
  scope :was_removed, -> { where(removed: true) }
end
