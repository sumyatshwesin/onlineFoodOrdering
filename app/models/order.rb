class Order < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :menus

  def post_date
    created_at.strftime("%b. %d、%I:%M:%S")
  end
end
