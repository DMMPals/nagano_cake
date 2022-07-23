class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id, foreign_key: true
      t.string :name, null: false
      t.integer :price, null: false
      t.text :explain, null: false
      t.boolean :is_active, default: true, null: false


      t.timestamps
    end
  end
end
