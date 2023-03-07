# encoding: utf-8
class InformacoesController < ApplicationController
  before_action :set_informacao, only: [:show, :edit, :update, :destroy, :aprovar, :inativar, :desaprovar]
  # before_action :validate_update, only: [:update]
  before_action :resources, only: [:index, :new, :create, :edit, :update]

  def index
    @q = Informacao.ransack(params[:q])
    @informacoes = @q.result
  end

  def show
    @informacao_detalhe = InformacaoDetalhe.new(informacao_id: @informacao.id)
    @informacao_detalhes = @informacao.informacao_detalhes
  end

  def new
    @informacao = Informacao.new
  end

  def edit
  end

  def create
    @informacao = Informacao.new(informacao_params)
    @informacao.autor = current_user

    respond_to do |format|
      if @informacao.save
        format.html { redirect_to informacoes_url, notice: I18n.t("messages.create.notice") }
        format.json { render :show, status: :created, location: @informacao }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @informacao.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @informacao.update(informacao_params)
      redirect_to informacoes_url, notice: t('messages.update.notice')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @informacao.destroy
      redirect_to informacoes_url, notice: t('messages.destroy.notice')
    else
      redirect_to informacoes_url, alert: @informacao.errors.full_messages.join(', ')
    end
  end

  def aprovar
    @informacao.aprovar!
    redirect_to informacoes_url, notice: t('messages.update.notice')
  end

  def desaprovar
    @informacao.desaprovar!
    redirect_to informacoes_url, notice: t('messages.update.notice')
  end

  def inativar
    @informacao.inativar!
    redirect_to informacoes_url, notice: t('messages.update.notice')
  end

  def sort
    @informacao = Informacao.find(params[:id])
    @informacao.insert_at(params[:position].to_i)
    head :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_informacao
      @informacao = Informacao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def informacao_params
      params.require(:informacao).permit(:descricao, :titulo, :destaque)
    end

    def resources
      @situacoes = Situacao.order(:id)
    end

    def validate_update
      return if @informacao.cadastrado?

      redirect_to informacoes_url, alert: t('messages.update.forbbiden')
    end
end
