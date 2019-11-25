class AddColumnToAnswer < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :user_question_id, :integer
  end
end
