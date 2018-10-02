require 'test_helper'

class DiscountedPartTest < ActiveSupport::TestCase
  def setup
    @part = discounted_parts :valid
  end

  def teardown
    @part = nil
  end

  test 'valid part' do
    assert @part.valid?
  end

  test 'invalid without sku label' do
    @part.sku_label = nil
    refute @part.valid?, 'part is valid without sku label'
    assert_not_nil @part.errors[:sku_label], 'no validation error for sku_label present'
  end

  test 'invalid without price' do
    @part.price = nil
    refute @part.valid?, 'part is valid without price'
    assert_not_nil @part.errors[:price], 'no validation error for price present'
  end

  test 'invalid without reporting make' do
    @part.reporting_make = nil
    refute @part.valid?, 'part is valid without reporting make'
    assert_not_nil @part.errors[:reporting_make], 'no validation error for reporting make present'
  end

  test 'invalid without brand name' do
    @part.brand_name = nil
    refute @part.valid?, 'part is valid without brand name'
    assert_not_nil @part.errors[:brand_name], 'no validation error for brand name present'
  end

  test 'invalid without category name' do
    @part.category_name = nil
    refute @part.valid?, 'part is valid without category name'
    assert_not_nil @part.errors[:category_name], 'no validation error for category name present'
  end

  test 'invalid without subcategory name' do
    @part.sub_category_name = nil
    refute @part.valid?, 'part is valid without subcategory name'
    assert_not_nil @part.errors[:sub_category_name], 'no validation error for subcategory name present'
  end

  test 'invalid without functional name' do
    @part.functional_name = nil
    refute @part.valid?, 'part is valid without functional name'
    assert_not_nil @part.errors[:functional_name], 'no validation error for functional name present'
  end

  test '#self.to_csv' do
    headers = ['sku_label', 'price', 'reporting_make', 'brand_name', 'category_name', 'sub_category_name', 'functional_name']
    headers.each_with_index do |header, i|
      assert_equal(header, DiscountedPart.to_csv.parse_csv[i], 'The expected header was not found')
    end
  end
end
