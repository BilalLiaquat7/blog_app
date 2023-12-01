class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true # this will create user_id and a corresponding index  (but students can also add column and index in separate commands)
      t.references :post, foreign_key: true # this will create post_id and a corresponding index (but students can also add column and index in separate commands)
      t.string :text
      t.timestamps
    end
  end
end
