class CreateJoinTableDdtQuestionStudy < ActiveRecord::Migration

  create_table :ddt_questions_studies, id: false do |t|
    t.integer :ddt_question_id, null: false, index: true
    t.integer :study_id, null: false, index: true
  end
end
