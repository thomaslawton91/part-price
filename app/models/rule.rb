class Rule < ApplicationRecord
  before_create :sanitize

  private

  def sanitize
    self.discount = discount / 100
  end
end
