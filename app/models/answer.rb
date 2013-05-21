class Answer < ActiveRecord::Base

 	belongs_to :question
 	has_many :answer_users, :dependent => :destroy

  attr_accessible :question, :body

  validates :question_id, :presence => true
  validates :body, :presence => true

  def self.answer(user, question, answer_body)
    answer = Answer.create question: question, body: answer_body
    AnswerUser.save_owner answer, user unless user.blank?
    return answer
  end
end