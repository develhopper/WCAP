class CreateBasicDemographics < ActiveRecord::Migration
  def change
    create_table :basic_demographics do |t|
      t.references :patient, index: true
      t.integer :file_number
      t.integer :private_code
      t.integer :gender
      t.integer :year_of_birth
      t.date :interview_date
      t.integer :marital_status
      t.integer :educational_year

      t.timestamps
    end
  end
end
