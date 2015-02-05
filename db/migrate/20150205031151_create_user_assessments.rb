class CreateUserAssessments < ActiveRecord::Migration
  def change
    create_table :user_assessments do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
