class DiscountedPart < ApplicationRecord
  validates :price, presence: true
  validates :sku_label, presence: true
  validates :reporting_make, presence: true
  validates :brand_name, presence: true
  validates :category_name, presence: true
  validates :sub_category_name, presence: true
  validates :functional_name, presence: true

  def self.to_csv
    attributes = %w[sku_label price reporting_make brand_name category_name sub_category_name functional_name]
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |discount|
        csv << discount.attributes.values_at(*attributes)
      end
    end
  end
end
