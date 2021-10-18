class OrdersController < ApplicationController
  def index
    @cart = Cart.select('
      menus.name,
      carts.quantity,
      carts.price
    ').joins(
      'LEFT JOIN menus ON menus.id = carts.menu_id'
    )
  end

  def show
  end

  def create
  end
end
