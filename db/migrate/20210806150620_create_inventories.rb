class CreateInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.string :brand
      t.string :model
      t.string :size
      t.string :tag
      t.string :category
      t.decimal :price, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
