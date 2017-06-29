require 'test_helper'

class PesajesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pesaje = pesajes(:one)
  end

  test "should get index" do
    get pesajes_url
    assert_response :success
  end

  test "should get new" do
    get new_pesaje_url
    assert_response :success
  end

  test "should create pesaje" do
    assert_difference('Pesaje.count') do
      post pesajes_url, params: { pesaje: { del: @pesaje.del, id_2: @pesaje.id_2, lvd: @pesaje.lvd, parto: @pesaje.parto, pesaje: @pesaje.pesaje, raza: @pesaje.raza } }
    end

    assert_redirected_to pesaje_url(Pesaje.last)
  end

  test "should show pesaje" do
    get pesaje_url(@pesaje)
    assert_response :success
  end

  test "should get edit" do
    get edit_pesaje_url(@pesaje)
    assert_response :success
  end

  test "should update pesaje" do
    patch pesaje_url(@pesaje), params: { pesaje: { del: @pesaje.del, id_2: @pesaje.id_2, lvd: @pesaje.lvd, parto: @pesaje.parto, pesaje: @pesaje.pesaje, raza: @pesaje.raza } }
    assert_redirected_to pesaje_url(@pesaje)
  end

  test "should destroy pesaje" do
    assert_difference('Pesaje.count', -1) do
      delete pesaje_url(@pesaje)
    end

    assert_redirected_to pesajes_url
  end
end
