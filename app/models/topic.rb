class Topic < ApplicationRecord
  belongs_to :user
  
  has_many :question_topics
  has_many :questions, through: :question_topics
  
  has_many :followings, as: :followable
  
  validates :content, presence: true, uniqueness: true
  
  def self.set_topic(question, topics, current_user)
    topics = topics.split(',')
    topics.each do |topic|
      new_topic = current_user.topics.find_or_create_by(content: topic)
      question_topic = QuestionTopic.create(question_id: question.id, topic_id: new_topic.id)
    end
  end
end
