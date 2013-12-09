class CreateUserReplies < ActiveRecord::Migration
  def change
    create_table :user_replies do |t|
      t.string :name
      t.string :email
      t.text :reply
      t.references :user_comment

      t.timestamps
    end
    add_index :user_replies, :user_comment_id
  end
end
