class RemoveColumnFromAnswer < ActiveRecord::Migration[5.2]
  def change
    remove_column :answer, :question_id
  end
end
