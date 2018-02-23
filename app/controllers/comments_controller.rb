class CommentsController < ApplicationController
  before_action :set_post
  
  def create
    @comment = @post.comments.build(comment_params) # build the new comment
    @comment.user_id = current_user.id # assign the new comment to the current user
    
    if @comment.save
      flash[:success] = "Your comment has been created!"
      redirect_to root_path
    else
      flash.now[:alert] = "Your new comment couldn't be created! Please check the form."
      render root_path
    end
  end
  
  # def show
  # end
  
  # def edit
  # end
  
  # def update
  # end
  
  def destroy
    @comment = @post.comments.find(params[:id])
    
    @comment.destroy
    flash[:success] = "comment deleted"
    redirect_to root_path
  end
  
  private
    def comment_params
      params.require(:comment).permit(:content)
    end
  
  def set_post
    @post = Post.find(params[:post_id])
  end
end
