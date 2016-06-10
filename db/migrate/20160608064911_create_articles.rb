class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :content
      t.string :excerpt
      t.attachment :image
      t.decimal :rate
      t.integer :view

      t.timestamps null: false
    end
  end
end
