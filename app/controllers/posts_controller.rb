class PostsController < ApplicationController
  def create
    Post.create(post_params)
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
    if user_signed_in?
      @message_has_been_sent = conversation_exist?
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:content, :image, :user_id)
  end
  
  def conversation_exist?
    Private::Conversation.between_users(current_user.id, @post.user.id).present?
  end
  
end