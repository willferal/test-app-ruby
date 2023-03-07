# encoding: utf-8
class TipoServicosController < ApplicationController
  before_action :set_tipo_servico, only: [:show, :edit, :update, :destroy]

  def index
    @q = TipoServico.ransack(params[:q])
    @tipo_servicos = @q.result.page(params[:page])
  end

  def show

  end

  def new
    @tipo_servico = TipoServico.new
  end

  def edit
  end

  def create
    @tipo_servico = TipoServico.new(tipo_servico_params)

    respond_to do |format|
      if @tipo_servico.save
        format.html { redirect_to tipo_servicos_url, notice: I18n.t("messages.create.notice") }
        format.json { render :show, status: :created, location: @tipo_servico }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tipo_servico.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @tipo_servico.update(tipo_servico_params)
      redirect_to tipo_servicos_url, notice: t('messages.update.notice')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @tipo_servico.destroy
      redirect_to tipo_servicos_url, notice: t('messages.destroy.notice')
    else
      redirect_to tipo_servicos_url, alert: @tipo_servico.errors.full_messages.join(', ')
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_servico
      @tipo_servico = TipoServico.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tipo_servico_params
      params.require(:tipo_servico).permit(:descricao)
    end
end
