class CreateJoinTableUserStudy < ActiveRecord::Migration
  def change
    create_join_table :users, :studies do |t|
      # t.index [:user_id, :study_id]
      # t.index [:study_id, :user_id]
    end
  end
end
