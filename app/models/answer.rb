class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  
  validates :content, :question_id, presence: true
  validates_uniqueness_of :user_id, scope: :question_id, message: 'You already answer this question'
  
  validate :can_not_answer_own_question
  
  private
  def can_not_answer_own_question
    self.errors[:base] << 'You can not answer of your own question' if question.user_id == user_id
  end
end
