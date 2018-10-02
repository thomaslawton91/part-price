require 'test_helper'

class RulesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get rules_url
    assert_response :success
  end

  test 'should create new rule' do
    assert_difference('Rule.count') do
      post rules_url, params: { rule: { discount: 10, relative_price: 'JIT Cogs' } }
    end

    assert_redirected_to root_url
    assert_equal 'Rule created successfully', flash[:info]
  end
end
