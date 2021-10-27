class Message < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 140 }
end