require 'test_helper'

class ReproduccionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reproduccion = reproduccions(:one)
  end

  test "should get index" do
    get reproduccions_url
    assert_response :success
  end

  test "should get new" do
    get new_reproduccion_url
    assert_response :success
  end

  test "should create reproduccion" do
    assert_difference('Reproduccion.count') do
      post reproduccions_url, params: { reproduccion: { acum_305d: @reproduccion.acum_305d, anonac: @reproduccion.anonac, anopart: @reproduccion.anopart, cria: @reproduccion.cria, del: @reproduccion.del, fecha_salida: @reproduccion.fecha_salida, id_2: @reproduccion.id_2, id_lact: @reproduccion.id_lact, lact: @reproduccion.lact, lechetotal: @reproduccion.lechetotal, madre: @reproduccion.madre, meses_parto: @reproduccion.meses_parto, mesparto: @reproduccion.mesparto, nacimiento: @reproduccion.nacimiento, padre: @reproduccion.padre, padre_cria: @reproduccion.padre_cria, parto: @reproduccion.parto, prenez: @reproduccion.prenez, removida: @reproduccion.removida, secado: @reproduccion.secado, servicios: @reproduccion.servicios, sexo_cria: @reproduccion.sexo_cria, toro_prenez: @reproduccion.toro_prenez } }
    end

    assert_redirected_to reproduccion_url(Reproduccion.last)
  end

  test "should show reproduccion" do
    get reproduccion_url(@reproduccion)
    assert_response :success
  end

  test "should get edit" do
    get edit_reproduccion_url(@reproduccion)
    assert_response :success
  end

  test "should update reproduccion" do
    patch reproduccion_url(@reproduccion), params: { reproduccion: { acum_305d: @reproduccion.acum_305d, anonac: @reproduccion.anonac, anopart: @reproduccion.anopart, cria: @reproduccion.cria, del: @reproduccion.del, fecha_salida: @reproduccion.fecha_salida, id_2: @reproduccion.id_2, id_lact: @reproduccion.id_lact, lact: @reproduccion.lact, lechetotal: @reproduccion.lechetotal, madre: @reproduccion.madre, meses_parto: @reproduccion.meses_parto, mesparto: @reproduccion.mesparto, nacimiento: @reproduccion.nacimiento, padre: @reproduccion.padre, padre_cria: @reproduccion.padre_cria, parto: @reproduccion.parto, prenez: @reproduccion.prenez, removida: @reproduccion.removida, secado: @reproduccion.secado, servicios: @reproduccion.servicios, sexo_cria: @reproduccion.sexo_cria, toro_prenez: @reproduccion.toro_prenez } }
    assert_redirected_to reproduccion_url(@reproduccion)
  end

  test "should destroy reproduccion" do
    assert_difference('Reproduccion.count', -1) do
      delete reproduccion_url(@reproduccion)
    end

    assert_redirected_to reproduccions_url
  end
end
