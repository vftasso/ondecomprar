class Question < ActiveRecord::Base

  has_many :question_users, :dependent => :destroy

  attr_accessible :body

  validates :body, :presence => true

  def self.ask(user, question_body)
    question = Question.create body: question_body
    QuestionUser.save_owner question, user unless user.blank?
    return question
  end
end