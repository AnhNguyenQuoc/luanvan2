class SessionsController < ApplicationController

      before_action :check_login, only: [:new, :create]

      def new
      end
  
      def create
            user = User.find_by(email: params[:session][:email].downcase)
            if user && user.authenticate(params[:session][:password])
                  log_in(user)
                  remember(user)
                  flash[:success] = "Đăng nhập thành công"
                  redirect_to root_path
            else
                  flash.now[:danger] = 'Mật khẩu hoặc email không đúng.'
                  render 'new'
            end
      end
      
      def destroy
      log_out if logged_in?
      flash.now[:info] = "Bạn đã đăng xuất"
      redirect_to root_path
      end


      private

      def check_login
            redirect_to root_path if logged_in?
      end
      
end
