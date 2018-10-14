class UsersController < ApplicationController
  def index
  end

  def new
      @user = User.new
  end 

  def create
      @user = User.create(user_params)
      if @user.save 
             log_in(@user)
            flash.now[:success] = "Đã tạo tài khoản thành công"
            redirect_to root_path
      else 
            render 'new'
            flash.now[:danger] = "Có lỗi xảy ra"
      end 

  end 



  private
  def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :username, :address, :phone)
  end
end
