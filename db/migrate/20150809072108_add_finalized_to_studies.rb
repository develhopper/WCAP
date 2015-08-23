class AddFinalizedToStudies < ActiveRecord::Migration
  def change
    add_column :studies, :finalized, :boolean, :default => false, :null => false
  end
end
