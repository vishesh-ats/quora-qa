class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.references :user
      t.string :content

      t.timestamps
    end
  end
end
