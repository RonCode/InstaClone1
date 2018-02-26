class ProfilesController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_post, only: [:show, :edit, :update, :destroy]
  # before_action :owned_post, only: [:edit, :update, :destroy]
  
  def show
    @user = User.find_by(user_name: params[:user_name])
    @posts = User.find_by(user_name: params[:user_name]).posts.order('created_at DESC')
  end
  
  def edit
    @user = User.find_by(user_name: params[:user_name])
    #before_action
  end
  
  def update
    
  end
  
  
  private
    def post_params
      params.require(:post).permit(:image, :caption)
    end
  
    # def set_post
    #   @post = Post.find(params[:id])
    # end
    
    # def owned_post
    #   unless current_user == @post.user
    #     flash[:alert] = "That post doesn't belong to you!"
    #     redirect_to root_path
    #   end
    # end
  
end
