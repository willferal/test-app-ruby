# encoding: utf-8
class ModuloDetalhesController < ApplicationController
  before_action :set_informacao_detalhe, only: [:show, :edit, :update, :destroy]

  def index
    @q = ModuloDetalhe.ransack(params[:q])
    @modulo_detalhes = @q.result
  end

  def show

  end

  def new
    @modulo_detalhe = ModuloDetalhe.new
  end

  def edit
  end

  def create
    @modulo_detalhe = ModuloDetalhe.new(modulo_detalhe_params)
    @modulo_detalhes = @modulo_detalhe.modulo.modulo_detalhes
    respond_to do |format|
      if @modulo_detalhe.save
        format.html { redirect_to modulo_path(@modulo_detalhe.modulo_id), notice: I18n.t("messages.create.notice") }
      else
        format.html { redirect_to modulo_path(@modulo_detalhe.modulo_id), alert: @modulo_detalhe.errors.full_messages.join(', ') }
      end
    end
  end

  def destroy
    modulo_id = @modulo_detalhe.modulo_id
    @modulo_detalhes = @modulo_detalhe.modulo.modulo_detalhes
    respond_to do |format|
      if @modulo_detalhe.destroy
        format.turbo_stream do
          flash.now[:notice] = t('messages.destroy.notice')
        end
        format.html do
          redirect_to modulo_path(modulo_id), notice: t('messages.destroy.notice')
        end
        format.json { head :no_content }
      else
        format.turbo_stream do
          flash.now[:error] = @modulo_detalhe.errors.full_messages.join(', ')
        end
        format.html do
          flash[:error] = @modulo_detalhe.errors.full_messages.join(', ')
          redirect_to modulo_path(modulo_id), status: :unprocessable_entity
        end
        format.json { head :no_content }
      end
    end
  end

  def sort_detalhes
    @modulo_detalhe = ModuloDetalhe.find(params[:id])
    @modulo_detalhe.insert_at(params[:position].to_i)
    head :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_informacao_detalhe
      @modulo_detalhe = ModuloDetalhe.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def modulo_detalhe_params
      params.require(:modulo_detalhe).permit(:posicao, :titulo, :descricao, :modulo_id)
    end
end
