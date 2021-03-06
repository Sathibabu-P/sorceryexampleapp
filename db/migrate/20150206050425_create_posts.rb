class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :author, polymorphic: true, index: true
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
