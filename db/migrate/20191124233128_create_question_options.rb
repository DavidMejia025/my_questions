class CreateQuestionOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :question_options do |t|
      t.integer :question_id
      t.string  :description
      t.integer :identifier
      t.boolean :correct_answer

      t.timestamps
    end
  end
end
