class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { maximum: 25 }
  validates :email, presence: true, uniqueness: true, email: true
  validates :password, presence: true, confirmation: true, length: { minimum: 8 }

  has_one_attached :avatar
  has_many :articles
  has_many :comments
end
