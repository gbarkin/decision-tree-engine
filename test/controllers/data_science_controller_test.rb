require "test_helper"

class DataScienceControllerTest < ActionDispatch::IntegrationTest
  test "should get product_management" do
    get data_science_product_management_url
    assert_response :success
  end

  test "should get blog" do
    get data_science_blog_url
    assert_response :success
  end

  test "should get music" do
    get data_science_music_url
    assert_response :success
  end
end
