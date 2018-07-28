require 'test_helper'

class SaleTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sale_type = sale_types(:one)
  end

  test "should get index" do
    get sale_types_url
    assert_response :success
  end

  test "should get new" do
    get new_sale_type_url
    assert_response :success
  end

  test "should create sale_type" do
    assert_difference('SaleType.count') do
      post sale_types_url, params: { sale_type: { name: @sale_type.name } }
    end

    assert_redirected_to sale_type_url(SaleType.last)
  end

  test "should show sale_type" do
    get sale_type_url(@sale_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_sale_type_url(@sale_type)
    assert_response :success
  end

  test "should update sale_type" do
    patch sale_type_url(@sale_type), params: { sale_type: { name: @sale_type.name } }
    assert_redirected_to sale_type_url(@sale_type)
  end

  test "should destroy sale_type" do
    assert_difference('SaleType.count', -1) do
      delete sale_type_url(@sale_type)
    end

    assert_redirected_to sale_types_url
  end
end
