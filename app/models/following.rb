class Following < ApplicationRecord
  belongs_to :followable, polymorphic: true
  
  validate :already_following
  validate :can_not_follow_own
  
  private
  def already_following
    followings = Following.exists?(followed_id: followed_id, followable_id: followable_id, followable_type: followable_type)
    self.errors[:base] << 'Already following' if followings
  end
  
  def can_not_follow_own
    case followable_type
      when 'User'
        self.errors[:base] << 'User can not follow himself' if followed_id == followable_id
      when 'Topic'
        self.errors[:base] << 'User can not follow own topic' if followed_id == follower_id
    end
  end
end
