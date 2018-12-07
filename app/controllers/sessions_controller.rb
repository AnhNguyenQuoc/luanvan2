class SessionsController < ApplicationController

      before_action :check_login, only: [:new, :create]
      before_action :current_cart, only: [:destroy]

      def new
      end
  
      def create
            if params[:session].present?
                  user = User.find_by(email: params[:session][:email].downcase)
                  if user && user.authenticate(params[:session][:password])
                        if user.activated?
                              log_in(user)
                              params[:session][:remember_me] == '1' ? remember(user) : forget(user)
                              flash[:success] = "Đăng nhập thành công"
                        
                              if user.role.id == 2
                                    if user.restaurant.nil?
                                          redirect_to tao_cua_hang_path
                                    else 
                                          redirect_to admin_res_path
                                    end
                              elsif user.role.id == 4
                                    redirect_to admin_path
                              elsif user.role.id == 3
                                    redirect_to admin_shipper_path
                              else
                                    redirect_back_or root_path
                              end
                        else 
                              message  = "Tài khoản chưa kích hoạt. "
                              message += "Hãy kiểm tra lại email của bạn."
                              flash[:danger] = message
                              redirect_to root_path
                        end
                  else
                        flash.now[:danger] = 'Mật khẩu hoặc email không đúng.'
                        render 'new'
                  end
            else 
                  begin
                        user = User.from_omniauth(request.env['omniauth.auth'])
                        log_in(user)
                        remember(user)
                        
                  rescue
                        flash.now[:danger] = 'Có lỗi xảy ra'
                  end
                  if user.phone.present? || user.address.present?
                        redirect_to root_path
                        flash[:success] = "Đăng nhập thành công"
                  else 
                        redirect_to edit_user_path(user)
                        flash[:success] = "Mời bạn vui lòng điền đầy đủ thông tin"
                  end
            end
      end
      
      def destroy
      log_out if logged_in?
      flash.now[:info] = "Bạn đã đăng xuất"
      if logged_in? && current_user.role_id == 1
            @current_cart.destroy
      end
      redirect_to root_path
      end


      private

      def check_login
            redirect_to root_path if logged_in?
      end
      
end
