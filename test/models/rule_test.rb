require 'test_helper'

class RuleTest < ActiveSupport::TestCase
  def setup
    @rule = rules :valid
  end

  test 'valid rule' do
    assert @rule.valid?
  end

  test 'invalid without relative price' do
    @rule.relative_price = nil
    refute @rule.valid?, 'rule is valid without relative price'
    assert_not_nil @rule.errors[:relative_price], 'no validation error for relative price present'
  end

  test 'invalid without discount' do
    @rule.discount = nil
    refute @rule.valid?, 'rule is valid without discount'
    assert_not_nil @rule.errors[:discount], 'no validation error for discount present'
  end

  test 'test sanitize before save' do
    @rule.expects(:sanitize)
    @rule.valid?
  end
end
