class CreateSkus < ActiveRecord::Migration[5.2]
  def change
    create_table :skus do |t|
      t.string :sku_label
      t.money :jit_cogs
      t.money :domestic_stocking_cogs
      t.money :best_stocking_cogs
      t.money :genuineeqprice
      t.string :reporting_make
      t.string :brand_name
      t.string :category_name
      t.string :sub_category_name
      t.string :functional_name

      t.timestamps
    end
  end
end
