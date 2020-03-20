class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.references :follower
      t.references :followed
      t.references :followable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
