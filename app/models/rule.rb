class Rule < ApplicationRecord
  before_create :sanitize

  private

  def sanitize
    self.discount = discount / 100
    self.relative_price = relative_price.downcase.gsub(/\s+/, "_")
  end
end
