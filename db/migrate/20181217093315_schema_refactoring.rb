class SchemaRefactoring < ActiveRecord::Migration[5.2]
  def change
    remove_column :quizzes, :answers_to_pass, :integer
    remove_column :answers, :option_id, :integer

    add_column :answers, :option_ids, :text, default: [], array: true

    add_reference :answers, :question, index: true
    add_reference :questions, :quiz, index: true

    add_index :answers, [:examination_id, :question_id], unique: true

    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

    add_column :categories, :active, :boolean, default: true

    add_column :quizzes, :pool_size, :integer, default: 5

    add_column :instructions, :active, :boolean, default: true
    add_column :instructions, :repeat, :boolean, default: true
    add_column :instructions, :repeat_date, :jsonb
    add_column :instructions, :control, :boolean, default: false
    add_column :instructions, :start_control, :jsonb
    add_column :instructions, :for_employees, :boolean, default: false

    add_column :instructions_users, :finished, :boolean, default: false
    add_column :instructions_users, :finish_date, :datetime

    add_column :questions, :required, :boolean, default: false
    add_column :questions, :mandatory, :boolean, default: false
  end
end
