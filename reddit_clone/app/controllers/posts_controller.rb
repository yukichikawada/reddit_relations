class PostsController < ApplicationController
  def create
    post = Post.new(post_params)
    post.author = current_user.id
    if post.save
      redirect_to sub_post_url(post)
    else
      flash[:errors] = post.errors.full_messages
      redirect_to new_sub_post_url(post)
    end
  end

  def show
    post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :sub_id)
  end
end
