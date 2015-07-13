class AddStudyToUser < ActiveRecord::Migration
  def change
    add_column :users, :current_study_id, :integer
  end
end
