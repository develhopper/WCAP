class CreateDdtQuestions < ActiveRecord::Migration
  def change
    create_table :ddt_questions do |t|
      t.integer :definite_value
      t.integer :indefinite_value
      t.integer :risk_rate
      t.integer :question_type

      t.timestamps
    end
  end
end
