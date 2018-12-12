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
        if @user.save 
                UserMailer.account_activation(@user).deliver_now
                flash[:success] = "Bạn vui lòng vào email để kích hoạt tài khoản"
                redirect_to root_path
        else 
                render 'new'
        end 

  end 

  def admin_create
      @user = User.create(user_params)
      @user.activated = true
      if @user.save 
            flash[:success] = "Đã tạo tài khoản thành công"
            redirect_to admin_danh_sach_nguoi_dung_path
      else 
            render 'admins/user_create'
            flash[:danger] = "Có lỗi xảy ra"
      end 

  end 


  def edit 
      @user = User.find(params[:id])
  end 

  def update 
      @user = User.find(params[:id])

        if @user.update_attributes(user_params)
            flash[:success] = "Cập nhật thành công"
            redirect_to root_path 
        else 
            flash[:danger] = "Có lỗi xảy ra"
            render 'edit'
        end
   end


   def orders_user
      @user = User.find(params[:id])
      @orders = @user.buyer_order.order("created_at DESC")
   end
   
   def list_restaurant_favorite
      @user = current_user
      @restaurants = @user.restaurants
   end

   def list_comment
        @user = current_user
        @comments = @user.comments 
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
