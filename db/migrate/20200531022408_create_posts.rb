class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :views, default: 0
      t.string :topic, default: "News"
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
