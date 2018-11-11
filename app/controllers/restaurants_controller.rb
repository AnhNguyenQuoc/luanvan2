class RestaurantsController < ApplicationController

   before_action :current_cart, only: [:show_order]
      rescue_from ActiveRecord::RecordNotFound do |exception|
            redirect_to cua_hang_path
      end

  def index
      @restaurants = Restaurant.all.page(params[:page])
      @restaurants = Restaurant.all.page(params[:page]) if params[:all].present?
      @restaurants = Restaurant.find_district(params[:find_district]).page(params[:page]) if params[:find_district].present?
      @restaurants = Restaurant.starts_with(params[:starts_with]).page(params[:page]) if params[:starts_with].present?
      @restaurants = Restaurant.order_rating.page(params[:page]) if params[:order_rating].present?
      @restaurants = Restaurant.order_name.page(params[:page]) if params[:order_name].present?
      @restaurants = Restaurant.find_type(params[:find_type]).page(params[:page]) if params[:find_type].present?
      store_location
  end

  def show
      @restaurant = Restaurant.find(params[:id])
      @products = @restaurant.products.limit(6)
      @comments = @restaurant.comments.limit(6)
      store_location
  end

  def show_order
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
      store_location
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
            redirect_to admin_res_path
      else 
            flash[:danger] = "Có lỗi xảy ra"
            render 'new'
      end
  end

  def destroy
      @restaurant = Restaurant.find(params[:id])
      if @restaurant.destroy 
            flash[:success] = "Xóa thành công"
            redirect_to admin_path
      else 
            flash[:danger] = "Có lỗi xảy ra"
      end
end

def show_comment
      @comment = Comment.new
      @restaurant = Restaurant.find(params[:id])
      @comments = @restaurant.comments.order(created_at: :desc)
      @your_comments = @restaurant.comments.where('user_id = ?', current_user.id).order(created_at: :desc) if logged_in?
      store_location
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
