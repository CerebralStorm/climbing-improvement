class UserAssessmentQuestion < ActiveRecord::Base
  belongs_to :user_assessment
  belongs_to :question
end
