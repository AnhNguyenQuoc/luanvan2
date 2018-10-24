class RestaurantsController < ApplicationController

   before_action :current_cart, only: [:show]
      rescue_from ActiveRecord::RecordNotFound do |exception|
            redirect_to restaurants_path
      end

  def index

      @restaurants = Restaurant.all
      @restaurants = Restaurant.find_district(params[:find_district]) if params[:find_district].present?
      @restaurants = Restaurant.starts_with(params[:starts_with]) if params[:starts_with].present?
      @restaurants = Restaurant.order_rating if params[:order_rating].present?
      @restaurants = Restaurant.order_name if params[:order_name].present?
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

def show_comment
      @comment = Comment.new
      @restaurant = Restaurant.find(params[:id])
      @comments = @restaurant.comments.order(created_at: :desc)
end

def edit 
      @restaurant = Restaurant.find_by(id: current_user.restaurant.id)
end 


def update 
      @restaurant = Restaurant.find_by(id: current_user.restaurant.id)
      if @restaurant.update_attributes(restaurant_params)
            if params[:restaurant][:image].present?
                  @restaurant.image.purge
                  @restaurant.image.attach(params[:restaurant][:image])
            end
            redirect_to admin_res_path
            flash[:success] = "Cập nhật thông tin thành công"
      else 
            render 'edit'
            flash[:danger] = "Có lỗi xảy ra"
      end
end

  private


  def restaurant_params
        params.require(:restaurant).permit(:name, :phone, :address, :description, :timeopen, :timeclose, :district_id, :restaurant_type_id)
  end
  
end
