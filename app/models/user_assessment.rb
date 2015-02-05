class UserAssessment < ActiveRecord::Base
  belongs_to :user

  has_many :user_assessment_questions
  has_many :questions, through: :user_assessment_questions

  after_create :add_questions

  def add_questions
    Question.all.each do |question|
      self.user_assessment_questions.create(question: question)
    end
  end
end
