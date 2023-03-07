# encoding: utf-8
class ServicoDetalhesController < ApplicationController
  before_action :set_servico_detalhe, only: [:show, :edit, :update, :destroy]

  def index
    @q = ServicoDetalhe.ransack(params[:q])
    @servico_detalhes = @q.result.page(params[:page])
  end

  def show

  end

  def new
    @servico_detalhe = ServicoDetalhe.new
  end

  def edit
  end

  def create
    servico = Servico.find_by(id: servico_detalhe_params[:servico_id])
    if servico.texto_aprovado?
      flash[:alert] = 'Texto já encontra-se aprovado, novas inclusões não permitidas.'
      redirect_back(fallback_location: servicos_url) and return
    end

    @servico_detalhe = ServicoDetalhe.new(servico_detalhe_params)
    @servico_detalhes = @servico_detalhe.servico.servico_detalhes.page(params[:page])
    respond_to do |format|
      if @servico_detalhe.save
        format.html { redirect_to servico_path(@servico_detalhe.servico_id), notice: I18n.t("messages.create.notice") }
      else
        format.html { redirect_to servico_path(@servico_detalhe.servico_id), alert: @servico_detalhe.errors.full_messages.join(', ') }
      end
    end
  end

  def destroy
    servico_id = @servico_detalhe.servico_id
    @servico_detalhes = @servico_detalhe.servico.servico_detalhes.page(params[:page])
    respond_to do |format|
      if @servico_detalhe.destroy
        format.turbo_stream do
          flash.now[:notice] = t('messages.destroy.notice')
        end
        format.html do
          redirect_to servico_path(servico_id), notice: t('messages.destroy.notice')
        end
        format.json { head :no_content }
      else
        format.turbo_stream do
          flash.now[:error] = @servico_detalhe.errors.full_messages.join(', ')
        end
        format.html do
          flash[:error] = @servico_detalhe.errors.full_messages.join(', ')
          redirect_to servico_path(servico_id), status: :unprocessable_entity
        end
        format.json { head :no_content }
      end
    end
  end

  def sort_detalhes
    @servico_detalhe = ServicoDetalhe.find(params[:id])
    @servico_detalhe.insert_at(params[:position].to_i)
    head :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_servico_detalhe
      @servico_detalhe = ServicoDetalhe.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def servico_detalhe_params
      params.require(:servico_detalhe).permit(:posicao, :titulo, :descricao, :servico_id, :tipo_detalhe_id)
    end
end
