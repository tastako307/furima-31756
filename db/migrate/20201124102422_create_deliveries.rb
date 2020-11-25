class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.references :order,        null: false, foreign_key: true
      t.integer    :prefecture,   null: false
      t.string     :post_number,  null: false
      t.string     :address_1,    null: false
      t.string     :address_2,    null: false
      t.string     :building,     default: ""
      t.string     :phone_number, null: false
      t.timestamps
    end
  end
end
