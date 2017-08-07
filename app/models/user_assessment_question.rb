class UserAssessmentQuestion < ActiveRecord::Base
  belongs_to :user_assessment
  belongs_to :question

  after_initialize :set_default_value

  def set_default_value
    self.value ||= 0
  end

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
