class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :carts
  has_many :orders

  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 140 }
  validates :phone_number, presence: true
end
