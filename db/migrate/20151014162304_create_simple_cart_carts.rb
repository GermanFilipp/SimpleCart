class CreateSimpleCartCarts < ActiveRecord::Migration
  def change
    create_table :simple_cart_carts do |t|
      t.decimal :total_price
      t.datetime :completed_date
      t.string :number
      t.belongs_to :customer,polymorphic: true
      t.timestamps null: false
    end
  end
end
