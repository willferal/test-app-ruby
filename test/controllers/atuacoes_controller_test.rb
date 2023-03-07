require "test_helper"

class AtuacoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @atuacao = atuacoes(:one)
  end

  test "should get index" do
    get atuacoes_url
    assert_response :success
  end

  test "should get new" do
    get new_atuacao_url
    assert_response :success
  end

  test "should create atuacao" do
    assert_difference("Atuacao.count") do
      post atuacoes_url, params: { atuacao: { descricao: @atuacao.descricao } }
    end

    assert_redirected_to atuacao_url(Atuacao.last)
  end

  test "should show atuacao" do
    get atuacao_url(@atuacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_atuacao_url(@atuacao)
    assert_response :success
  end

  test "should update atuacao" do
    patch atuacao_url(@atuacao), params: { atuacao: { descricao: @atuacao.descricao } }
    assert_redirected_to atuacao_url(@atuacao)
  end

  test "should destroy atuacao" do
    assert_difference("Atuacao.count", -1) do
      delete atuacao_url(@atuacao)
    end

    assert_redirected_to atuacoes_url
  end
end
