require 'test_helper'

class SkuTest < ActiveSupport::TestCase
  def setup
    @sku = skus :valid
  end

  def teardown
    Sku.delete_all
    @sku = nil
  end

  test 'valid sku' do
    assert @sku.valid?
  end

  test 'invalid without sku label' do
    @sku.sku_label = nil
    refute @sku.valid?, 'sku is valid without sku label'
    assert_not_nil @sku.errors[:sku_label], 'no validation error for sku label present'
  end

  test '#self.import' do
    imported_sku =
    Sku.import(File.open(Rails.root.join('test', 'fixtures', 'files', 'test.csv')))
    Sku.last.valid?
  end
end
