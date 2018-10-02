class Rule < ApplicationRecord
  validates :relative_price, presence: true
  validates :discount, presence: true

  before_save :sanitize

  private

  def sanitize
    self.discount = discount / 100
    self.relative_price = relative_price.downcase.gsub(/\s+/, "_")
  end
end
