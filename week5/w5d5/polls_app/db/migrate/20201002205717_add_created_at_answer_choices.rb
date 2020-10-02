class AddCreatedAtAnswerChoices < ActiveRecord::Migration[5.2]
  def change
    add_column :answer_choices, :text, :string, null: false
    add_column :answer_choices, :question_id, :integer, null: false

    add_timestamps :answer_choices
    add_index :answer_choices, :question_id
  end
end
