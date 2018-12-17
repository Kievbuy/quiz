class InitialMigration < ActiveRecord::Migration[5.2]
  def change

    create_table :categories do |t|
      t.string :title
      t.text   :description
    end

    create_table :instructions do |t|
      t.string :title
      t.text   :body
      t.references :category, index: true

      t.timestamps
    end

    create_table :instructions_users do |t|
      t.references :instruction
      t.references :user
    end

    add_index :instructions_users, [:instruction_id, :user_id], unique: true

    create_table :instructions_quizzes do |t|
      t.references :quiz
      t.references :instruction
    end

    add_index :instructions_quizzes, [:quiz_id, :instruction_id], unique: true

    create_table :examinations do |t|
      t.references :user, index: true
      t.references :quiz, index: true
      t.integer    :status

      t.timestamps
    end

    create_table :quizzes do |t|
      t.string  :title
      t.integer :level
      t.boolean :active
      t.integer :answers_to_pass
      t.integer :percent_to_pass

      t.timestamps
    end

    create_table :questions do |t|
      t.text       :body
      t.boolean    :active

      t.timestamps
    end

    create_table :questions_quizzes do |t|
      t.references :quiz
      t.references :question
    end

    add_index :questions_quizzes, [:quiz_id, :question_id], unique: true

    create_table :options do |t|
      t.text       :body
      t.boolean    :correct
      t.references :question

      t.timestamps
    end

    create_table :answers do |t|
      t.references :examination
      t.references :option

      t.timestamps
    end

  end
end
