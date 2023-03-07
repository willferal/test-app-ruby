require "test_helper"

class EntidadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entidade = entidades(:one)
  end

  test "should get index" do
    get entidades_url
    assert_response :success
  end

  test "should get new" do
    get new_entidade_url
    assert_response :success
  end

  test "should create entidade" do
    assert_difference("Entidade.count") do
      post entidades_url, params: { entidade: { bairro_endereco: @entidade.bairro_endereco, complemento_endereco: @entidade.complemento_endereco, cpf_cnpj: @entidade.cpf_cnpj, endereco: @entidade.endereco, municipio_id: @entidade.municipio_id, nome: @entidade.nome, numero_endereco: @entidade.numero_endereco, origem_id: @entidade.origem_id, razao_social: @entidade.razao_social, tipo_entidade_id: @entidade.tipo_entidade_id } }
    end

    assert_redirected_to entidade_url(Entidade.last)
  end

  test "should show entidade" do
    get entidade_url(@entidade)
    assert_response :success
  end

  test "should get edit" do
    get edit_entidade_url(@entidade)
    assert_response :success
  end

  test "should update entidade" do
    patch entidade_url(@entidade), params: { entidade: { bairro_endereco: @entidade.bairro_endereco, complemento_endereco: @entidade.complemento_endereco, cpf_cnpj: @entidade.cpf_cnpj, endereco: @entidade.endereco, municipio_id: @entidade.municipio_id, nome: @entidade.nome, numero_endereco: @entidade.numero_endereco, origem_id: @entidade.origem_id, razao_social: @entidade.razao_social, tipo_entidade_id: @entidade.tipo_entidade_id } }
    assert_redirected_to entidade_url(@entidade)
  end

  test "should destroy entidade" do
    assert_difference("Entidade.count", -1) do
      delete entidade_url(@entidade)
    end

    assert_redirected_to entidades_url
  end
end
