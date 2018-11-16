class UsersController < ApplicationController

before_action :check_correct_user, only: [:show, :orders_user]

  def index
  end

  def new
      @user = User.new
  end 

  def show

  end

  def create
      @user = User.create(user_params)
      respond_to do |format|
        if @user.save 
                UserMailer.account_activation(@user).deliver_now
                flash[:success] = "Bạn vui lòng vào email để kích hoạt tài khoản"
                format.html {redirect_to root_path } 
        else 
                flash[:danger] = "Có lỗi xảy ra"
                format.js {}
        end 
    end

  end 

  def admin_create
      @user = User.create(user_params)
      @user.activated = true
      if @user.save 
            flash[:success] = "Đã tạo tài khoản thành công"
            redirect_to admin_danh_sach_nguoi_dung_path
      else 
            redirect_back(fallback_location: admin_danh_sach_nguoi_dung_path)
            flash[:danger] = "Có lỗi xảy ra"
      end 

  end 


  def edit 
      @user = User.find(params[:id])
  end 

  def update 
      @user = User.find(params[:id])
        respond_to do |format|
            if @user.update_attributes(user_params)
                    flash[:success] = "Cập nhật thành công"
                    format.html {redirect_back root_path } 
            else 
                    flash[:danger] = "Có lỗi xảy ra"    
                    format.js {}
            end 
        end
   end


   def orders_user
      @user = User.find(params[:id])
      @orders = @user.buyer_order
   end
   
   def list_restaurant_favorite
      @user = current_user
      @restaurants = @user.restaurants
   end

   def destroy 
      @users = User.where.not(id: current_user.id)
      @user = User.find(params[:id])
      @user.destroy
   end

  private

  def check_correct_user
      user = User.find(params[:id])
      redirect_to root_path unless user == current_user
  end

  def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :username, :address, :phone, :role_id, :district_id)
  end
end
