class Question < ApplicationRecord
  belongs_to :user
  
  has_many :answers
  has_many :question_topics
  has_many :topics, through: :question_topics
  
  validates :content, presence: true
end
