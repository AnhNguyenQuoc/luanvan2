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
            end 
      end 
  end

  
end
