class TemplatesController < ApplicationController
      before_action :check_role_logged, only: [:index]

  def index
  end

  def shipper 
  end 

  def inforestaurant
  end


  private 
  def check_role_logged
      if logged_in?
            if current_user.role.id == 2
                  redirect_to admin_res_path
            elsif current_user.role.id == 3
                  redirect_to admin_shipper_path
            elsif current_user.role.id == 4
                  redirect_to admin_path
            end 
      end 
  end

  
end
