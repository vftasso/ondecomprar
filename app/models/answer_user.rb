class AnswerUser < ActiveRecord::Base

  attr_accessible :answer, :user, :owner

  belongs_to :answer
  belongs_to :user

	validates :answer_id, :presence => true
  validates :user_id, :presence => true, :uniqueness => {:scope => :answer_id}
  validates :owner, :presence => true

  def self.save_owner(answer, user)
  	create answer: answer, user: user, owner: true
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