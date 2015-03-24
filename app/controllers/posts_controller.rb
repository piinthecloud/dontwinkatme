class PostsController < ApplicationController

  def index
    @posts = Post.order(created_at: :desc)
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def show
  #   @post = Post.find(params[:id])
  # end

  private


  def post_params
    params.require(:post).permit(:title, :text, :alias)
  end

end
