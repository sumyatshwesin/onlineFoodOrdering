class Restaurant < ApplicationRecord
  has_many :menus
  has_many :carts
end
