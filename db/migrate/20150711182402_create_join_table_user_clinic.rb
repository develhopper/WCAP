class CreateJoinTableUserClinic < ActiveRecord::Migration
  def change
    create_join_table :users, :clinics do |t|
      # t.index [:user_id, :clinic_id]
      # t.index [:clinic_id, :user_id]
    end
  end
end
