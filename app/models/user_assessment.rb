class UserAssessment < ActiveRecord::Base
  belongs_to :user

  has_many :user_assessment_questions
  has_many :questions, through: :user_assessment_questions

  after_create :add_questions

  def add_questions
    question_slots = (1..30).to_a
    Question.all.each do |question|
      order = question_slots.delete_at(rand(question_slots.length))
      self.user_assessment_questions.create(question: question, question_order: order)
    end
  end
end
