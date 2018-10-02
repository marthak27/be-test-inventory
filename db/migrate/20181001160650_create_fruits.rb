class CreateFruits < ActiveRecord::Migration[5.2]
  def change
    create_table :fruits do |t|
      t.string :name
      t.decimal :price
      t.integer :stock

      t.timestamps
    end
  end
end
