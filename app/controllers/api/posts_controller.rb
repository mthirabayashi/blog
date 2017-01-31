class Api::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save

    else
      render json: {postErrors: @post.errors.full_messages}, status: 422
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)

    else
      render json: {postErrors: @post.errors.full_messages}, status: 422
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy

    else
      render json: {postErrors: @post.errors.full_messages}, status: 422
    end
  end

  private
  def post_params
    params.require(:post).permit(:author_id, :body, :title)
  end

end
