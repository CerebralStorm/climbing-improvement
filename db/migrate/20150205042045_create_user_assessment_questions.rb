class CreateUserAssessmentQuestions < ActiveRecord::Migration
  def change
    create_table :user_assessment_questions do |t|
      t.integer :question_id
      t.integer :user_assessment_id

      t.timestamps
    end
  end
end
