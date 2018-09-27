class RulesWorker
  include Sidekiq::Worker

  def perform(rule_id)
    clause = {}
    unclean = Rule.find_by(id: rule_id).attributes.slice('relative_price', 'discount', 'reporting_make', 'brand_name', 'category_name', 'sub_category_name', 'functional_name')
    discount = unclean['discount']
    relative = unclean['relative_price']
    unclean.delete('relative_price')
    unclean.delete('discount')
    unclean.each do |attr_name, attr_value|
      if attr_value == nil
        unclean.delete('attr_value')
      elsif attr_value.length > 0
        clause[attr_name] = attr_value
      end
    end
    skus = Sku.where(clause).to_a

    skus.each do |s|
      attributes = s.attributes
      part = DiscountedPart.new
      case relative
      when 'jit_cogs'
        part.price = attributes['jit_cogs'].to_f * discount.to_f
      when 'domestic_stocking_cogs'
        part.price = attributes['domestic_stocking_cogs'].to_f * discount.to_f
      when 'best_stocking_cogs'
        part.price = attributes['best_stocking_cogs'].to_f * discount.to_f
      else
        part.price = attributes['genuine_price'].to_f * discount.to_f
      end
      part.sku_label = attributes['sku_label']
      part.reporting_make = attributes['reporting_make']
      part.brand_name = attributes['brand_name']
      part.category_name = attributes['category_name']
      part.functional_name = attributes['functional_name']
      if DiscountedPart.exists?(sku_label: attributes['sku_label'])
        DiscountedPart.update_all({price: part.price})
      else
        part.save
      end
    end
  end
end
