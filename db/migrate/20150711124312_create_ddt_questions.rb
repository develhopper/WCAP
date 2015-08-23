class CreateDdtQuestions < ActiveRecord::Migration
  def change
    create_table :ddt_questions do |t|
      t.integer :definite_value, null: false
      t.integer :indefinite_value, null: false
      t.integer :risk_rate, null: false
      t.integer :question_type, null: false

      t.timestamps
    end
  end
end
