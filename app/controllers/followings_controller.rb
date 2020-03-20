class FollowingsController < ApplicationController
  before_action :authenticate_user!
  
  def follow_user
    user = User.find_by_id(params[:id])
    @following = current_user.followeds.new(follower_id: user.id, followable_id: user.id, followable_type: 'User')
    if @following.save
      flash[:notice] = "User followed successfully"
      redirect_to root_path
    else
      flash[:notice] = @following.errors.full_messages.to_sentence
      redirect_to root_path
    end
  end
  
  def follow_topic
    topic = Topic.find_by_id(params[:id])
    @following = current_user.followeds.new(follower_id: topic.user_id, followable_id: topic.id, followable_type: 'Topic')
    if @following.save
      flash[:notice] = "Topic followed successfully"
      redirect_to root_path
    else
      flash[:notice] = @following.errors.full_messages.to_sentence
      redirect_to root_path
    end
  end

  def followed_users
    @followed_users = current_user.followeds.where(followable_type: 'User')
  end

  def followed_topics
    @followed_topics = @followed_users = current_user.followeds.where(followable_type: 'Topic')
  end
end
