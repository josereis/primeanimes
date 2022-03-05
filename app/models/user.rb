class User < ApplicationRecord
  extend Enumerize

  has_one_attached :avatar
  
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :validatable, :timeoutable

  enumerize :profile, in: %i[admin otaku], scope: true, predicates: true, default: :otaku
  enumerize :status, in: %i[active inactive suspended], scope: true, predicates: true, default: :active

  validates :name, :status, :profile, presence: true
  validates :name, length: { minimum: 3 }
  validates_inclusion_of :status, in: User.status.values
  validates_inclusion_of :profile, in: User.profile.values

  scope :with_profile, -> (profiles) { where(profile: profiles) }
  scope :with_status, -> (statuses) { where(status: statuses) }
  scope :with_email, -> (email) { where(email: email) }

  def active_for_authentication?
    super && self.active?
  end
end
