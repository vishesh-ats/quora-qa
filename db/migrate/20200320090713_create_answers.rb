class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.references :user
      t.references :question
      t.text :content

      t.timestamps
    end
  end
end
