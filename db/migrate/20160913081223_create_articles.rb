class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.integer :price
      t.string :description
      t.references :owner_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
