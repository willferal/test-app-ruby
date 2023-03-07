# encoding: utf-8
class ModulosController < ApplicationController
  before_action :set_modulo, only: [:show, :edit, :update, :destroy, :aprovar_texto, :desaprovar_texto]

  def index
    @q = Modulo.ransack(params[:q])
    @modulos = @q.result
  end

  def show
    @modulo_detalhe = ModuloDetalhe.new(modulo_id: @modulo.id)
    @modulo_detalhes = @modulo.modulo_detalhes
  end

  def new
    @modulo = Modulo.new
  end

  def edit
  end

  def create
    @modulo = Modulo.new(modulo_params)
    @modulo.autor = current_user

    respond_to do |format|
      if @modulo.save
        format.html { redirect_to modulos_url, notice: I18n.t("messages.create.notice") }
        format.json { render :show, status: :created, location: @modulo }
      else
        format.html { render :new }
        format.json { render json: @modulo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @modulo.update(modulo_params)
      redirect_to modulos_url, notice: t('messages.update.notice')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @modulo.destroy
      redirect_to modulos_url, notice: t('messages.destroy.notice')
    else
      redirect_to modulos_url, alert: @modulo.errors.full_messages.join(', ')
    end
  end

  def sort
    @modulo = Modulo.find(params[:id])
    @modulo.insert_at(params[:position].to_i)
    head :ok
  end

  def aprovar_texto
    if @modulo.aprovar_texto!(current_user)
      redirect_to modulos_url, notice: t('messages.update.notice')
    else
      redirect_to @modulo, alert: @modulo.errors.full_messages.join(', ')
    end
  end

  def desaprovar_texto
    if @modulo.desaprovar_texto!(current_user)
      redirect_to modulos_url, notice: t('messages.update.notice')
    else
      redirect_to @modulo, alert: @modulo.errors.full_messages.join(', ')
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modulo
      @modulo = Modulo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def modulo_params
      params.require(:modulo).permit(:titulo, :descricao, :icone, :url, :ativo)
    end
end
