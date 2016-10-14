require 'test_helper'

class PoisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @poi = pois(:one)
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  test "should get index" do
    get pois_url
    assert_response :success
  end

  test "should get new" do
    get new_poi_url
    assert_response :success
  end

  test "should create poi" do
    assert_difference('Poi.count') do
      post pois_url, params: { poi: { address: @poi.address, api: @poi.api, apiId: @poi.apiId, image: @poi.image, lat: @poi.lat, long: @poi.long, map: @poi.map, name: @poi.name, price: @poi.price, rate: @poi.rate, review: @poi.review, types: @poi.types } }
    end

    assert_redirected_to poi_url(Poi.last)
  end

  test "should show poi" do
    get poi_url(@poi)
    assert_response :success
  end

  test "should get edit" do
    get edit_poi_url(@poi)
    assert_response :success
  end

  test "should update poi" do
    patch poi_url(@poi), params: { poi: { address: @poi.address, api: @poi.api, apiId: @poi.apiId, image: @poi.image, lat: @poi.lat, long: @poi.long, map: @poi.map, name: @poi.name, price: @poi.price, rate: @poi.rate, review: @poi.review, types: @poi.types } }
    assert_redirected_to poi_url(@poi)
  end

  test "should destroy poi" do
    assert_difference('Poi.count', -1) do
      delete poi_url(@poi)
    end

    assert_redirected_to pois_url
  end
end
