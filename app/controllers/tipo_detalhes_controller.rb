# encoding: utf-8
class TipoDetalhesController < ApplicationController
  before_action :set_tipo_detalhe, only: [:show, :edit, :update, :destroy]

  def index
    @q = TipoDetalhe.ransack(params[:q])
    @tipo_detalhes = @q.result.page(params[:page])
  end

  def show

  end

  def new
    @tipo_detalhe = TipoDetalhe.new
  end

  def edit
  end

  def create
    @tipo_detalhe = TipoDetalhe.new(tipo_detalhe_params)

    respond_to do |format|
      if @tipo_detalhe.save
        format.html { redirect_to tipo_detalhes_url, notice: I18n.t("messages.create.notice") }
        format.json { render :show, status: :created, location: @tipo_detalhe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tipo_detalhe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @tipo_detalhe.update(tipo_detalhe_params)
      redirect_to tipo_detalhes_url, notice: t('messages.update.notice')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @tipo_detalhe.destroy
      redirect_to tipo_detalhes_url, notice: t('messages.destroy.notice')
    else
      redirect_to tipo_detalhes_url, alert: @tipo_detalhe.errors.full_messages.join(', ')
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_detalhe
      @tipo_detalhe = TipoDetalhe.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tipo_detalhe_params
      params.require(:tipo_detalhe).permit(:descricao)
    end
end
