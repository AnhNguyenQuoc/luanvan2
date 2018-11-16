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
                        flash[:success] = "Đăng bình luận thành công"
                        format.html {redirect_to restaurant_comment_path(@restaurant) } 
                  else 
                        flash[:danger] = "Có lỗi xảy ra"
                        format.js {}
                  end
            end
      end
      
      def destroy
            @comment = Comment.find(params[:id])
            @comment.destroy 
            redirect_back fallback_location: admin_path
      end
      



      private

      def comment_params
            params.require(:comment).permit(:description, :rating)
      end

end
