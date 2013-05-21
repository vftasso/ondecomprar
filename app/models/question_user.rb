class QuestionUser < ActiveRecord::Base
  
  attr_accessible :question, :user, :owner

  belongs_to :question
  belongs_to :user

  validates :question_id, :presence => true
  validates :user_id, :presence => true, :uniqueness => {:scope => :question_id}
  validates :owner, :presence => true

  def self.save_owner(question, user)
  	create question: question, user: user, owner: true
  end

  def like!
  	update_attribute(:dislike, false)
    update_attribute(:like, true)
  end

  def dislike!
  	update_attribute(:like, false)
    update_attribute(:dislike, true)
  end
end