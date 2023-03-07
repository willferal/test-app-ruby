# encoding: utf-8
class InformacaoDetalhesController < ApplicationController
  before_action :set_informacao_detalhe, only: [:show, :edit, :update, :destroy]

  def index
    @q = InformacaoDetalhe.ransack(params[:q])
    @informacao_detalhes = @q.result
  end

  def show

  end

  def new
    @informacao_detalhe = InformacaoDetalhe.new
  end

  def edit
  end

  def create
    @informacao_detalhe = InformacaoDetalhe.new(informacao_detalhe_params)
    @informacao_detalhes = @informacao_detalhe.informacao.informacao_detalhes
    respond_to do |format|
      if @informacao_detalhe.save
        format.html { redirect_to informacao_path(@informacao_detalhe.informacao_id), notice: I18n.t("messages.create.notice") }
      else
        format.html { redirect_to informacao_path(@informacao_detalhe.informacao_id), alert: 'Favor informar os campos obrigatórios.'  }
      end
    end
  end

  def destroy
    informacao_id = @informacao_detalhe.informacao_id
    @informacao_detalhes = @informacao_detalhe.informacao.informacao_detalhes
    respond_to do |format|
      if @informacao_detalhe.destroy
        format.turbo_stream do
          flash.now[:notice] = t('messages.destroy.notice')
        end
        format.html do
          redirect_to informacao_path(informacao_id), notice: t('messages.destroy.notice')
        end
        format.json { head :no_content }
      else
        format.turbo_stream do
          flash.now[:error] = @informacao_detalhe.errors.full_messages.join(', ')
        end
        format.html do
          flash[:error] = @informacao_detalhe.errors.full_messages.join(', ')
          redirect_to informacao_path(informacao_id), status: :unprocessable_entity
        end
        format.json { head :no_content }
      end
    end
  end

  def sort_detalhes
    @informacao_detalhe = InformacaoDetalhe.find(params[:id])
    @informacao_detalhe.insert_at(params[:position].to_i)
    head :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_informacao_detalhe
      @informacao_detalhe = InformacaoDetalhe.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def informacao_detalhe_params
      params.require(:informacao_detalhe).permit(:posicao, :titulo, :descricao, :informacao_id)
    end
end
