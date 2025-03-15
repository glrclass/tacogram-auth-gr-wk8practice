class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
  end
  
  def create
    @user = User.find_by({ "id" => session["user_id"] })
    if @user != nil
    @post = Post.new
    @post["body"] = params["body"]
    @post["image"] = params["image"]
    @post["user_id"]= @user["id"] # TODO: assign logged-in user as user that created the post
    @post.save
    else
      flash["notice"] = "Login first."
    end
    redirect_to "/posts"
    end
  end
end
