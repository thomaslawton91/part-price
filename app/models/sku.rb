class Sku < ApplicationRecord
  validates :sku_label, presence: true
  validates :jit_cogs, presence: true
  validates :domestic_stocking_cogs, presence: true
  validates :best_stocking_cogs, presence: true
  validates :genuineeqprice, presence: true
  validates :reporting_make, presence: true
  validates :brand_name, presence: true
  validates :category_name, presence: true
  validates :sub_category_name, presence: true
  validates :functional_name, presence: true
  
  def self.import(file)
    Sku.delete_all
    CSV.foreach(file.path, headers: true) do |row|
      Sku.create! row.to_hash
    end
  end
end
