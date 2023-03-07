# encoding: utf-8
class AtuacoesController < ApplicationController
  before_action :set_atuacao, only: [:show, :edit, :update, :destroy]

  def index
    @q = Atuacao.ransack(params[:q])
    @atuacoes = @q.result.page(params[:page])
  end

  def show

  end

  def new
    @atuacao = Atuacao.new
  end

  def edit
  end

  def create
    @atuacao = Atuacao.new(atuacao_params)

    respond_to do |format|
      if @atuacao.save
        format.html { redirect_to atuacoes_url, notice: I18n.t("messages.create.notice") }
        format.json { render :show, status: :created, location: @atuacao }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @atuacao.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @atuacao.update(atuacao_params)
      redirect_to atuacoes_url, notice: t('messages.update.notice')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @atuacao.destroy
      redirect_to atuacoes_url, notice: t('messages.destroy.notice')
    else
      redirect_to atuacoes_url, alert: @atuacao.errors.full_messages.join(', ')
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atuacao
      @atuacao = Atuacao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def atuacao_params
      params.require(:atuacao).permit(:descricao)
    end
end
