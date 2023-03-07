require "test_helper"

class FormatacoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @formatacao = formatacoes(:one)
  end

  test "should get index" do
    get formatacoes_url
    assert_response :success
  end

  test "should get new" do
    get new_formatacao_url
    assert_response :success
  end

  test "should create formatacao" do
    assert_difference("Formatacao.count") do
      post formatacoes_url, params: { formatacao: { descricao: @formatacao.descricao } }
    end

    assert_redirected_to formatacao_url(Formatacao.last)
  end

  test "should show formatacao" do
    get formatacao_url(@formatacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_formatacao_url(@formatacao)
    assert_response :success
  end

  test "should update formatacao" do
    patch formatacao_url(@formatacao), params: { formatacao: { descricao: @formatacao.descricao } }
    assert_redirected_to formatacao_url(@formatacao)
  end

  test "should destroy formatacao" do
    assert_difference("Formatacao.count", -1) do
      delete formatacao_url(@formatacao)
    end

    assert_redirected_to formatacoes_url
  end
end
