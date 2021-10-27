class CartsController < ApplicationController
  before_action :authenticate_user!,　only: [:create, :edit, :update, :delete]
  def index
    @carts = Cart.all
  end

  def show

  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu =  @restaurant.menus.find(params[:menu_id])
    @param_data = params[:food]
    @quantity = @param_data[:quantity]
    @price = @param_data[:price]
    @total_amount = @price.to_i * @quantity.to_i
    @cart = @menu.carts.build(quantity: @quantity, price: @total_amount)
    @cart.user_id = current_user.id
    @cart.restaurant_id = @menu.restaurant_id
    if @cart.save
      redirect_to "/restaurants/#{@restaurant.id}"
    end
  end

  def edit
    @cart = Cart.find(params[:cart_id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.find(params[:menu_id])
  end

  def update
    restaurant = Restaurant.find(params[:restaurant_id])
    menu = restaurant.menus.find(params[:menu_id])
    @param_data = params[:food]
    @quantity = @param_data[:quantity]
    @price = @param_data[:price]
    @total_amount = @price.to_i * @quantity.to_i
    @cart_update = menu.carts.find(params[:cart_id]).update(quantity: @quantity, price: @total_amount)
    if @cart_update
      redirect_to "/orders"
    end
  end

  def delete
    @cart = Cart.find(params[:cart_id])
    if @cart.destroy
      redirect_to("/orders")
    end
  end
end
