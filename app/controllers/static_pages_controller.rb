class StaticPagesController < ApplicationController

  def home
    @posts = Post.where(:created_at => (1.month.ago)..(Date.today+1.day))
    @users = User.all.order(lastlogin: :desc).limit(12)
    @topics = Topic.all
    @topposts = Post.order(views: :desc).limit(5)
  end


end
