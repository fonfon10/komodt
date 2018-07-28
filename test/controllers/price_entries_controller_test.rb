require 'test_helper'

class PriceEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @price_entry = price_entries(:one)
  end

  test "should get index" do
    get price_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_price_entry_url
    assert_response :success
  end

  test "should create price_entry" do
    assert_difference('PriceEntry.count') do
      post price_entries_url, params: { price_entry: { date_expirate: @price_entry.date_expirate, distributor_id: @price_entry.distributor_id, package_id: @price_entry.package_id, price: @price_entry.price } }
    end

    assert_redirected_to price_entry_url(PriceEntry.last)
  end

  test "should show price_entry" do
    get price_entry_url(@price_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_price_entry_url(@price_entry)
    assert_response :success
  end

  test "should update price_entry" do
    patch price_entry_url(@price_entry), params: { price_entry: { date_expirate: @price_entry.date_expirate, distributor_id: @price_entry.distributor_id, package_id: @price_entry.package_id, price: @price_entry.price } }
    assert_redirected_to price_entry_url(@price_entry)
  end

  test "should destroy price_entry" do
    assert_difference('PriceEntry.count', -1) do
      delete price_entry_url(@price_entry)
    end

    assert_redirected_to price_entries_url
  end
end
