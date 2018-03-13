class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :sub_id
      t.integer :author
      t.timestamps
    end
  end
end
