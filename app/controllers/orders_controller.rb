class OrdersController < ApplicationController
  def index
    @cart = Cart.select('
      carts.menu_id,
      carts.restaurant_id,
      menus.name,
      carts.quantity,
      carts.price,
      carts.id,
      restaurants.name AS restaurant_name,
      restaurants.delivery_fee
    ').joins(
      'LEFT JOIN restaurants ON restaurants.id = carts.restaurant_id',
      'LEFT JOIN menus ON menus.id = carts.menu_id'
    )
  end

  def show
  end

  def create
    @cart = Cart.all
    @order = @cart.each do |c|
      Order.create(user_id: c.user_id, restaurant_id: c.restaurant_id, menu_id: c.menu_id, quantity: c.quantity, price: c.price)
    end
    Cart.delete_all
    redirect_to "/"
  end
end
