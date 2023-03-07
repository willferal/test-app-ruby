# encoding: utf-8
class TipoEntidadesController < ApplicationController
  before_action :set_tipo_entidade, only: [:show, :edit, :update, :destroy]

  def index
    @q = TipoEntidade.ransack(params[:q])
    @tipo_entidades = @q.result.page(params[:page])
  end

  def show

  end

  def new
    @tipo_entidade = TipoEntidade.new
  end

  def edit
  end

  def create
    @tipo_entidade = TipoEntidade.new(tipo_entidade_params)

    respond_to do |format|
      if @tipo_entidade.save
        format.html { redirect_to tipo_entidades_url, notice: I18n.t("messages.create.notice") }
        format.json { render :show, status: :created, location: @tipo_entidade }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tipo_entidade.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @tipo_entidade.update(tipo_entidade_params)
      redirect_to tipo_entidades_url, notice: t('messages.update.notice')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @tipo_entidade.destroy
      redirect_to tipo_entidades_url, notice: t('messages.destroy.notice')
    else
      redirect_to tipo_entidades_url, alert: @tipo_entidade.errors.full_messages.join(', ')
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_entidade
      @tipo_entidade = TipoEntidade.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tipo_entidade_params
      params.require(:tipo_entidade).permit(:descricao)
    end
end
