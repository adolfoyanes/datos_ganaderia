require 'test_helper'

class VacasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vaca = vacas(:one)
  end

  test "should get index" do
    get vacas_url
    assert_response :success
  end

  test "should get new" do
    get new_vaca_url
    assert_response :success
  end

  test "should create vaca" do
    assert_difference('Vaca.count') do
      post vacas_url, params: { vaca: { anonac: @vaca.anonac, becerro: @vaca.becerro, diagno: @vaca.diagno, fparto: @vaca.fparto, grupo_racial: @vaca.grupo_racial, id_2: @vaca.id_2, nropar: @vaca.nropar, padre: @vaca.padre, peso18: @vaca.peso18, pesodestete: @vaca.pesodestete, pesonacer: @vaca.pesonacer, sexo: @vaca.sexo, tipser: @vaca.tipser, toroas: @vaca.toroas } }
    end

    assert_redirected_to vaca_url(Vaca.last)
  end

  test "should show vaca" do
    get vaca_url(@vaca)
    assert_response :success
  end

  test "should get edit" do
    get edit_vaca_url(@vaca)
    assert_response :success
  end

  test "should update vaca" do
    patch vaca_url(@vaca), params: { vaca: { anonac: @vaca.anonac, becerro: @vaca.becerro, diagno: @vaca.diagno, fparto: @vaca.fparto, grupo_racial: @vaca.grupo_racial, id_2: @vaca.id_2, nropar: @vaca.nropar, padre: @vaca.padre, peso18: @vaca.peso18, pesodestete: @vaca.pesodestete, pesonacer: @vaca.pesonacer, sexo: @vaca.sexo, tipser: @vaca.tipser, toroas: @vaca.toroas } }
    assert_redirected_to vaca_url(@vaca)
  end

  test "should destroy vaca" do
    assert_difference('Vaca.count', -1) do
      delete vaca_url(@vaca)
    end

    assert_redirected_to vacas_url
  end
end
