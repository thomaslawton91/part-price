class CreateDiscountedParts < ActiveRecord::Migration[5.2]
  def change
    create_table :discounted_parts do |t|
      t.money :price, null: false
      t.string :sku_label, null: false
      t.string :reporting_make, null: false
      t.string :brand_name, null: false
      t.string :category_name, null: false
      t.string :sub_category_name, null: false
      t.string :functional_name, null: false

      t.timestamps
    end
  end
end
