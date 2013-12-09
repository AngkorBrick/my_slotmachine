class CreateUserComments < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
      t.string :name
      t.string :email
      t.text :comment

      t.timestamps
    end
  end
end
