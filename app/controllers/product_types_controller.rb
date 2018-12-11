class ProductTypesController < ApplicationController
      def index
            @product_types = ProductType.all
      end

      def new 
            @product_type = ProductType.new 
      end 

      def create 
            @product_type = ProductType.new(product_type_params)
                  if @product_type.save 
                        flash[:success] = "Tạo sản phẩm thành công"
                        redirect_to admin_loai_thuc_an_path
                  else 
                        render 'new'
                  end

                  
      end 

      def edit 
            @product_type = ProductType.find(params[:id])
      end 

      def update 
            @product_type = ProductType.find(params[:id])
                  if @product_type.update_attributes(product_type_params)
                        redirect_to admin_loai_thuc_an_path
                        flash[:success] = "Cập nhật thành công"
                  else 
                        render 'edit'
                  end

      end 


      def destroy
            @product_types = ProductType.all
            @product_type = ProductType.find(params[:id])
            if @product_type.destroy 
                  flash[:success] = "Xóa thành công"
                  redirect_to admin_loai_thuc_an_path
            else 
                  redirect_to admin_loai_thuc_an_path
            end
            
      end
      private

      def product_type_params
            params.require(:product_type).permit(:name)
      end
end
