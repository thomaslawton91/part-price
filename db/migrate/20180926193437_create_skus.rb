class CreateSkus < ActiveRecord::Migration[5.2]
  def change
    create_table :skus do |t|
      t.string :label
      t.float :jit_cogs
      t.float :domestic_stocking_cogs
      t.float :best_stocking_cogs
      t.float :genuine_price
      t.string :reporting_make
      t.string :brand_name
      t.string :category_name
      t.string :sub_category_name
      t.string :functional_name

      t.timestamps
    end
  end
end
