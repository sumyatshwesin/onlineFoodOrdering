class Menu < ApplicationRecord
  belongs_to :restaurant
  has_many :carts
  has_many :orders
end
