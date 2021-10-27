class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.paginate(page: params[:page], per_page: 6)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @menus = Menu.where(restaurant_id: @restaurant)
  end
end
