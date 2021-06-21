class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.string     :post_code,     null: false
      t.integer    :shipping_area, null: false
      t.string     :city,          null: false
      t.string     :address,       null: false
      t.string     :building
      t.string     :phone_number,  null: false
      t.references :history,       foreign_key: true
      t.timestamps
    end
  end
end
