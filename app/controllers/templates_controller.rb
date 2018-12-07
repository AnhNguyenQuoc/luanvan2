class TemplatesController < ApplicationController
      before_action :check_role_logged, only: [:index]

  def index
      @products_type = ProductType.order("RANDOM()").limit(6)
  end

  def shipper 
  end 

  def restaurantinfo
  end


  private 
  def check_role_logged
      if logged_in?
            if current_user.role.id == 2
                  if current_user.restaurant.nil?
                        redirect_to restaurant_create_path
                  else 
                        redirect_to admin_res_path
                  end
            elsif current_user.role.id == 3
                  redirect_to admin_shipper_path
            elsif current_user.role.id == 4
                  redirect_to admin_path
            end 
      end 
  end

  
end
