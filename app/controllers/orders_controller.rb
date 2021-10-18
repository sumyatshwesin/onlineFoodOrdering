class OrdersController < ApplicationController
  def index
    @cart = Cart.select('
      carts.menu_id,
      carts.restaurant_id,
      menus.name,
      carts.quantity,
      carts.price,
      carts.id
    ').joins(
      'LEFT JOIN menus ON menus.id = carts.menu_id'
    )
  end

  def show
  end

  def create
  end
end
