class RestaurantTypesController < ApplicationController

      def index
            @restaurant_types = RestaurantType.all
      end

      def new 
            @restaurant_type = RestaurantType.new 
      end 

      def create 
            @restaurant_type = RestaurantType.new(restaurant_types_params)
                  if @restaurant_type.save 
                        redirect_to admin_loai_cua_hang_path
                        flash[:success] = "Tạo sản phẩm thành công"
                  else 
                        render 'new'
                  end
      end 

      def edit 
            @restaurant_type = RestaurantType.find(params[:id])
      end 

      def update 
            @restaurant_type = RestaurantType.find(params[:id])
                  if @restaurant_type.update_attributes(restaurant_types_params)
                        redirect_to admin_loai_cua_hang_path
                        flash[:success] = "Cập nhật thành công"
                  else 
                        render 'edit'
                  end 

      end 


      def destroy
            @restaurant_types = RestaurantType.all
            @restaurant_type = RestaurantType.find(params[:id])
            if @restaurant_type.destroy 
                  redirect_to admin_loai_cua_hang_path
                  flash[:success] = "Xóa thành công"
            else 
                  redirect_to admin_loai_cua_hang_path
            end
      end   
      private

      def restaurant_types_params
            params.require(:restaurant_type).permit(:name)
      end
      
end
