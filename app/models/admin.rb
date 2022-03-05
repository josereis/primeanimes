class Admin < ApplicationRecord
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :registerable, :recoverable, :rememberable
  devise :database_authenticatable, :validatable, :timeoutable

  validates :name, presence: true, length: { minimum: 3 }
end
