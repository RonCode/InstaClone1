class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    if @post = Post.create(post_params)
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    else
      flash.now[:alert] = "Your new post couldn't be created!  Please check the form."
      render :new
    end
  end
  
  def show
    # before_action
  end
  
  def edit
    # before_action
  end
  
  def update
    # before_action
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated"
      redirect_to @post
    else
      render 'edit'
    end
  end
  
  def destroy
    # before_action
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to posts_path
  end
 
  private
    def post_params
      params.require(:post).permit(:image, :caption)
    end
  
    def set_post
      @post = Post.find(params[:id])
    end
end
