require 'test_helper'

class BookingReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get booking_reviews_new_url
    assert_response :success
  end

  test "should get create" do
    get booking_reviews_create_url
    assert_response :success
  end

  test "should get show" do
    get booking_reviews_show_url
    assert_response :success
  end

  test "should get destroy" do
    get booking_reviews_destroy_url
    assert_response :success
  end

  test "should get index" do
    get booking_reviews_index_url
    assert_response :success
  end

end
