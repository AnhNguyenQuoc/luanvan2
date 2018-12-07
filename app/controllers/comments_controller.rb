class CommentsController < ApplicationController

      def create
            @restaurant = Restaurant.find(params[:restaurant_id])
            @comment = Comment.new(comment_params)
            if params[:comment][:images].present?
                  @comment.images.attach(params[:comment][:images])
            end
            @comment.user = current_user
            @comment.restaurant = @restaurant
            respond_to do |format|
                  if @comment.save 
                        @comments = @restaurant.comments.order(created_at: :desc)
                        format.js {render 'create.js.erb'}
                  else 
                        flash[:danger] = "Có lỗi xảy ra"
                        format.js {render "error.js.erb"}
                  end
            end
      end
      
      def destroy
            @comment = Comment.find(params[:id])
            @comment.destroy 
            
            respond_to do |format|
                  format.js {}
            end
      end

      def destroy_admin
            @comment = Comment.find(params[:id])
            

            if @comment.destroy 
                  redirect_back(fallback_location: admin_path)
            end
      end



      private

      def comment_params
            params.require(:comment).permit(:description, :rating)
      end

end
