class MenusController < ApplicationController
  def index
  end

  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.find(params[:id])
    @carts = Cart.all
    @cart = Cart.select(:price).where(user_id: current_user)
  end
end
