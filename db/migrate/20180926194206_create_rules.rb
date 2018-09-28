class CreateRules < ActiveRecord::Migration[5.2]
  def change
    create_table :rules do |t|
      t.string :relative_price
      t.money  :discount
      t.string :reporting_make
      t.string :brand_name
      t.string :category_name
      t.string :sub_category_name
      t.string :functional_name

      t.timestamps
    end
  end
end
