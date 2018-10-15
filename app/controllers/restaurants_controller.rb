class RestaurantsController < ApplicationController

   before_action :current_cart, only: [:show]
      rescue_from ActiveRecord::RecordNotFound do |exception|
            redirect_to restaurants_path
      end

  def index
      @restaurants = Restaurant.all
  end

  def show
      @restaurant = Restaurant.find(params[:id])
      @order = Order.new
      @products = @restaurant.products
      if session[:store_id] != params[:id]
            session[:store_id] = params[:id]
            if(@current_cart)
                  @current_cart.destroy
            end    
            @current_cart = Cart.create 
            session[:cart_id] = @current_cart.id
      end
  end 

  def new
        @restaurant = Restaurant.new
  end
  

  def create
      @restaurant = Restaurant.create(restaurant_params)
      @restaurant.image.attach(params[:restaurant][:image])
      @restaurant.user_id = current_user.id
      if @restaurant.save
            flash[:success] = "Tạo cửa hàng thành công"
            redirect_to root_path
      else 
            flash[:danger] = "Có lỗi xảy ra"
            render 'new'
      end
  end

  def destroy
      @restaurant = Restaurant.find(params[:id])
      if @restaurant.destroy 
            flash[:success] = "Xóa thành công"
            redirect_to root_path
      else 
            flash[:danger] = "Có lỗi xảy ra"
      end
end

  private


  def restaurant_params
        params.require(:restaurant).permit(:name, :phone, :address, :description, :timeopen, :timeclose, :district_id)
  end
  
end
