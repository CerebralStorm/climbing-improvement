class CreateUserAssessments < ActiveRecord::Migration
  def change
    create_table :user_assessments do |t|
      t.integer :user_id
      t.integer :mental_score
      t.integer :technique_score
      t.integer :physical_score

      t.timestamps
    end
  end
end
