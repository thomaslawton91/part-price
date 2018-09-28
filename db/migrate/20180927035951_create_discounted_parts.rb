class CreateDiscountedParts < ActiveRecord::Migration[5.2]
  def change
    create_table :discounted_parts do |t|
      t.money :price
      t.string :sku_label
      t.string :reporting_make
      t.string :brand_name
      t.string :category_name
      t.string :sub_category_name
      t.string :functional_name

      t.timestamps
    end
  end
end
