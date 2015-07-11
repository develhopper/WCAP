class CreateJoinTableDdtQuestionStudy < ActiveRecord::Migration
  def change
    create_join_table :DdtQuestions, :studies do |t|
      # t.index [:ddt_question_id, :study_id]
      # t.index [:study_id, :ddt_question_id]
    end
  end
end
