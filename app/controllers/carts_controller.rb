class CartsController < ApplicationController
  def index
  end

  def show
  end

  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    menu =  restaurant.menus.find(params[:menu_id])
    @param_data = params[:food]
    @quantity = @param_data[:quantity]
    @price = @param_data[:price]
    @total_amount = @price.to_i * @quantity.to_i
    @cart = menu.carts.build(quantity: @quantity, price: @total_amount)
    @cart.user_id = current_user.id
    @cart.restaurant_id = menu.restaurant_id
    if @cart.save
      redirect_to "/restaurants/#{restaurant.id}/menus/#{menu.id}"
    else
      redirect_to "/restaurants/#{restaurant.id}/menus/#{menu.id}"
    end
  end
end
