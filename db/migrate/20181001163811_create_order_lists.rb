class CreateOrderLists < ActiveRecord::Migration[5.2]
  def change
    create_table :order_lists do |t|
      t.references :order, foreign_key: true
      t.references :fruit, foreign_key: true
      t.integer :qty
      t.integer :price

      t.timestamps
    end
  end
end
