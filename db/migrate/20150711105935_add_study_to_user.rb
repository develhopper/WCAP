class AddStudyToUser < ActiveRecord::Migration
  def change
    add_column :users, :study_id, :refrence
  end
end
