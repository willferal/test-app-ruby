# encoding: utf-8
class NotificacoesController < ApplicationController
  before_action :set_notificacao, only: [:show, :edit, :update, :destroy, :aprovar, :inativar]
  before_action :validate_update, only: [:update]
  before_action :resources, only: [:index, :new, :create, :edit, :update]

  def index
    @q = Notificacao.ransack(params[:q])
    @notificacoes = @q.result.page(params[:page])
  end

  def show

  end

  def new
    @notificacao = Notificacao.new
    @notificacao.data_hora = DateTime.current
  end

  def edit
  end

  def create
    @notificacao = Notificacao.new(notificacao_params)
    @notificacao.data_hora = DateTime.current
    @notificacao.user = current_user

    respond_to do |format|
      if @notificacao.save
        format.html { redirect_to notificacoes_url, notice: I18n.t("messages.create.notice") }
        format.json { render :show, status: :created, location: @notificacao }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @notificacao.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @notificacao.update(notificacao_params)
      redirect_to notificacoes_url, notice: t('messages.update.notice')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @notificacao.destroy
      redirect_to notificacoes_url, notice: t('messages.destroy.notice')
    else
      redirect_to notificacoes_url, alert: @notificacao.errors.full_messages.join(', ')
    end
  end

  def aprovar
    @notificacao.user_logged = current_user
    if @notificacao.aprovar!
      redirect_to notificacoes_url, notice: t('messages.update.notice')
    else
      flash[:alert] = @notificacao.errors.full_messages.join(', ')
      redirect_back(fallback_location: notificacoes_url)
    end
  end

  def inativar
    @notificacao.user_logged = current_user
    if @notificacao.inativar!
      redirect_to notificacoes_url, notice: t('messages.update.notice')
    else
      @notificacao.errors.add(:base, 'errors.message.inactive_notification')
      flash[:alert] = @notificacao.errors.full_messages.join(', ')
      redirect_back(fallback_location: notificacoes_url)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notificacao
      @notificacao = Notificacao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def notificacao_params
      params.require(:notificacao).permit(:descricao, :vigencia, :assunto)
    end

    def resources
      @situacoes = Situacao.order(:id)
    end

    def validate_update
      return if @notificacao.cadastrado?

      redirect_to notificacoes_url, alert: t('messages.update.forbbiden')
    end
end
