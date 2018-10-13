class RestaurantsController < ApplicationController

  def index
      @restaurants = Restaurant.all
  end

  def show
      @restaurant = Restaurant.find(params[:id])
      @products = @restaurant.products
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
