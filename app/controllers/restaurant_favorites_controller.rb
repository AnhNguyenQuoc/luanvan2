class RestaurantFavoritesController < ApplicationController

    def create 
        @restaurant = Restaurant.find_by(id: params[:restaurant_id])
        @restaurant_favorite = RestaurantFavorite.new 
        @restaurant_favorite.restaurant = @restaurant
        @restaurant_favorite.user = current_user 
        respond_to do |format|
            @restaurant_favorite.save
            format.js {render 'create.js.erb'}
        end
    end 


    def destroy 
        @restaurant = Restaurant.find_by(id: params[:restaurant_id])
        respond_to do |format|
            current_user.restaurants.delete(@restaurant)
            format.js {render 'create.js.erb'}
        end
    end
end
