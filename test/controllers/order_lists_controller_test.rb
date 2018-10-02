require 'test_helper'

class OrderListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_list = order_lists(:one)
  end

  test "should get index" do
    get order_lists_url, as: :json
    assert_response :success
  end

  test "should create order_list" do
    assert_difference('OrderList.count') do
      post order_lists_url, params: { order_list: { fruit_id: @order_list.fruit_id, order_id: @order_list.order_id, price: @order_list.price, qty: @order_list.qty } }, as: :json
    end

    assert_response 201
  end

  test "should show order_list" do
    get order_list_url(@order_list), as: :json
    assert_response :success
  end

  test "should update order_list" do
    patch order_list_url(@order_list), params: { order_list: { fruit_id: @order_list.fruit_id, order_id: @order_list.order_id, price: @order_list.price, qty: @order_list.qty } }, as: :json
    assert_response 200
  end

  test "should destroy order_list" do
    assert_difference('OrderList.count', -1) do
      delete order_list_url(@order_list), as: :json
    end

    assert_response 204
  end
end
