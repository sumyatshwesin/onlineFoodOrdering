class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
  end

  def order
    @orders = Order.select('
      orders.menu_id,
      orders.restaurant_id,
      GROUP_CONCAT(menus.name) AS name,
      restaurants.name AS restaurant_name,
      orders.created_at,
      orders.user_id,
      SUM(orders.price) AS total_price,
      restaurants.delivery_fee
    ').joins(
      'LEFT JOIN restaurants ON restaurants.id = orders.restaurant_id',
      'LEFT JOIN menus ON menus.id = orders.menu_id'
    ).group('strftime("%Y-%m-%d %H:%M:%S", orders.created_at)').where('orders.user_id = ?', current_user.id).order(
      'orders.created_at DESC'
    )
  end
end
