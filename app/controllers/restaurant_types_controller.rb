class RestaurantTypesController < ApplicationController

      def index
            @restaurant_types = RestaurantType.all
      end

      def new 
            @restaurant_type = RestaurantType.new 
      end 

      def create 
            @restaurant_type = RestaurantType.new(restaurant_types_params)
            respond_to do |format|
                  if @restaurant_type.save 
                        format.html {redirect_to admin_loai_cua_hang_path}
                        flash[:success] = "Tạo sản phẩm thành công"
                  else 
                        format.js {}
                        flash[:danger] = "Có lỗi xảy ra"
                  end
            end
      end 

      def edit 
            @restaurant_type = RestaurantType.find(params[:id])
      end 

      def update 
            @restaurant_type = RestaurantType.find(params[:id])
            respond_to do |format|
                  if @restaurant_type.update_attributes(restaurant_types_params)
                        format.html {redirect_to admin_loai_cua_hang_path}
                        flash[:success] = "Cập nhật thành công"
                  else 
                        format.js {render 'create.js.erb'}
                        flash[:danger] = "Có lỗi xảy ra"
                  end 
            end

      end 


      def destroy
            @restaurant_types = RestaurantType.all
            @restaurant_type = RestaurantType.find(params[:id])
            @restaurant_type.destroy 
            flash[:success] = "Xóa thành công"
            respond_to do |format|
                  format.js { render 'index.js.erb' }
            end
      end
      private

      def restaurant_types_params
            params.require(:restaurant_type).permit(:name)
      end
      
end
