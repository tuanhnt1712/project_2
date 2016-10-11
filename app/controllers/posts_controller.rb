class PostsController < ApplicationController

  def index
    @posts = Post.search(params[:search]).order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: "The post #{@post.title} has been uploaded."
    else
      render "new"
    end
  end

  def edit
  end

  def show
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.present?
      @post.destroy
    end
    redirect_to posts_path, notice:  "The post #{@post.title} has been deleted."
   end

  private

    def post_params
      params.require(:post).permit(:title, :attachment)
    end
end
