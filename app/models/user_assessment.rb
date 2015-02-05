class UserAssessment < ActiveRecord::Base
  belongs_to :user

  has_many :user_assessment_questions
  has_many :questions, through: :user_assessment_questions
end
