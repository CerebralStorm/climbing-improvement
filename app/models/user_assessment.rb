class UserAssessment < ActiveRecord::Base
  belongs_to :user

  has_many :user_assessment_questions, -> { order 'user_assessment_questions.question_order' }, dependent: :destroy
  has_many :questions, through: :user_assessment_questions

  after_create :add_questions

  def add_questions
    question_slots = (1..Question.count).to_a
    Question.all.each do |question|
      order = question_slots.delete_at(rand(question_slots.length))
      self.user_assessment_questions.create(question: question, question_order: order)
    end
  end

  def next_question(user_assessment_question)
    order = user_assessment_question.question_order + 1
    user_assessment_questions.where(question_order: order).first
  end

  def previous_question(user_assessment_question)
    return nil if user_assessment_question.question_order == 1
    order = user_assessment_question.question_order - 1
    user_assessment_questions.where(question_order: order).first
  end

  def completed?
    user_assessment_questions.where.not(value: nil).count == Question.count
  end

  def started?
    user_assessment_questions.where.not(value: nil).exists?
  end

  def first_unanswered_question
    user_assessment_questions.where(value: nil).first
  end

  def compute_totals
    self.mental_score = user_assessment_questions.mental.sum(&:value)
    self.technique_score = user_assessment_questions.technique.sum(&:value)
    self.physical_score = user_assessment_questions.physical.sum(&:value)
    self.save if self.changed?
  end
end
