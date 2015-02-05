class UserAssessmentQuestion < ActiveRecord::Base
  belongs_to :user_assessment
  belongs_to :question

  def self.mental
    where(question_id: Question.mental)
  end

  def self.technique
    where(question_id: Question.technique)
  end

  def self.physical
    where(question_id: Question.physical)
  end
end
