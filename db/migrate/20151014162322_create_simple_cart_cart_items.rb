class CreateSimpleCartCartItems < ActiveRecord::Migration
  def change
    create_table :simple_cart_cart_items do |t|
      t.integer :quantity, null: false
      t.decimal :price
      t.belongs_to :cart
      t.belongs_to :product, polymorphic: true

      t.timestamps null: false
    end
  end
end
