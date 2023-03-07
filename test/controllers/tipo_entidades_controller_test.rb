require "test_helper"

class TipoEntidadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_entidade = tipo_entidades(:one)
  end

  test "should get index" do
    get tipo_entidades_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_entidade_url
    assert_response :success
  end

  test "should create tipo_entidade" do
    assert_difference("TipoEntidade.count") do
      post tipo_entidades_url, params: { tipo_entidade: { descricao: @tipo_entidade.descricao } }
    end

    assert_redirected_to tipo_entidade_url(TipoEntidade.last)
  end

  test "should show tipo_entidade" do
    get tipo_entidade_url(@tipo_entidade)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_entidade_url(@tipo_entidade)
    assert_response :success
  end

  test "should update tipo_entidade" do
    patch tipo_entidade_url(@tipo_entidade), params: { tipo_entidade: { descricao: @tipo_entidade.descricao } }
    assert_redirected_to tipo_entidade_url(@tipo_entidade)
  end

  test "should destroy tipo_entidade" do
    assert_difference("TipoEntidade.count", -1) do
      delete tipo_entidade_url(@tipo_entidade)
    end

    assert_redirected_to tipo_entidades_url
  end
end
