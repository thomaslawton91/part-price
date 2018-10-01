class Sku < ApplicationRecord
  validates :sku_label, presence: true

  def self.import(file)
    Sku.delete_all
    CSV.foreach(file.path, headers: true) do |row|
      Sku.create! row.to_hash
    end
  end
end
