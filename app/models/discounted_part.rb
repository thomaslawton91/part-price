class DiscountedPart < ApplicationRecord

  def self.to_csv
    attributes = %w{sku_label price reporting_make brand_name category_name sub_category_name functional_name}
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |discount|
        csv << discount.attributes.values_at(*attributes)
      end
    end
  end
end
