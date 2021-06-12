class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,               null: false
      t.integer :price,             null: false
      t.references :user,           null: false, forein_key: true
      t.integer :category_id,       null: false
      t.integer :prodact_status_id, null: false
      t.integer :condition_id,      null: false
      t.integer :shipping_id,       null: false
      t.integer :description,       null: false        
      t.timestamps
    end
  end
end
