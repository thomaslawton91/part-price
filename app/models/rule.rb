class Rule < ApplicationRecord
  has_many :discounted_parts

  validates :relative_price, presence: true
  validates :discount, presence: true

  before_create :sanitize

  private

  def sanitize
    self.discount = discount / 100
    self.relative_price = relative_price.downcase.gsub(/\s+/, "_")
  end
end
