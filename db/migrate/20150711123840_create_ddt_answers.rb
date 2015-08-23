class CreateDdtAnswers < ActiveRecord::Migration
  def change
    create_table :ddt_answers do |t|
      t.references :ddt, index: true
      t.references :ddt_question, index: true, null: false
      t.boolean :response, null: false, default: false

      t.timestamps
    end
  end
end
