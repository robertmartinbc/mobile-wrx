class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :title
      t.text :description
      t.float :price
      t.string :expiration
      t.string :website
      t.string :qrcode

      t.timestamps
    end
  end
end
