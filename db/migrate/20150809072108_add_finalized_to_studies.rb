class AddFinalizedToStudies < ActiveRecord::Migration
  def change
    add_column :studies, :finalized, :boolean
  end
end
