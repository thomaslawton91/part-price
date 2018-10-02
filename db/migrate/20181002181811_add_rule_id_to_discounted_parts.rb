class AddRuleIdToDiscountedParts < ActiveRecord::Migration[5.2]
  def change
    add_column :discounted_parts, :rule_id, :integer
  end
end
