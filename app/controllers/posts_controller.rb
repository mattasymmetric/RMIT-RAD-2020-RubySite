class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]

  def new
    @post = Post.new
    @topics = Topic.all
  end

  def show
    @post = Post.find(params[:id])
    @post.increment!(:views)
    @user = @post.user
    @topic = @post.topic
  end

  def create
    @topics = Topic.all
    post_params[:topic] = Topic.find(Integer(post_params[:topic_id]))
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post successfully created!'
      redirect_to @post
    else
      render 'new'
    end
  end

  def destroy
  end

  private

    def post_params
      params.require(:post).permit(:title, :topic_id, :content)
    end
end
