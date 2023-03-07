# encoding: utf-8
class ServicosController < ApplicationController
  before_action :set_servico, only: [:show, :edit, :update, :destroy, :aprovar_texto, :desaprovar_texto]
  before_action :resources, only: [:index, :new, :create, :edit, :update]

  def index
    @q = Servico.ransack(params[:q])
    @servicos = @q.result.page(params[:page])
    @situacoes = Servico::SITUACOES
  end

  def show
    @servico_detalhe = ServicoDetalhe.new(servico_id: @servico.id)
    @servico_detalhes = @servico.servico_detalhes.page(params[:page])
    @foto = Foto.new(servico_id: @servico.id)
    @fotos = @servico.fotos.page(params[:page])
    @tipo_detalhes = TipoDetalhe.all
  end

  def new
    @servico = Servico.new
  end

  def edit
  end

  def create
    @servico = Servico.new(servico_params)
    @servico.user = current_user

    respond_to do |format|
      if @servico.save
        format.html { redirect_to servicos_url, notice: I18n.t("messages.create.notice") }
        format.json { render :show, status: :created, location: @servico }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @servico.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @servico.update(servico_params)
      redirect_to servicos_url, notice: t('messages.update.notice')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @servico.destroy
      redirect_to servicos_url, notice: t('messages.destroy.notice')
    else
      redirect_to servicos_url, alert: @servico.errors.full_messages.join(', ')
    end
  end

  def aprovar_texto
    if @servico.aprovar_texto!(current_user)
      redirect_to servico_path(@servico), notice: t('messages.update.notice')
    else
      flash[:alert] = @servico.errors.full_messages.join(', ')
      redirect_back(fallback_location: servicos_url)
    end
  end

  def desaprovar_texto
    if @servico.desaprovar_texto!(current_user)
      redirect_to servico_path(@servico), notice: t('messages.update.notice')
    else
      flash[:alert] = @servico.errors.full_messages.join(', ')
      redirect_back(fallback_location: servicos_url)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_servico
      @servico = Servico.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def servico_params
      params.require(:servico).permit(:tipo_servico_id, :entidade_id, :vigencia_inicial, :vigencia_final, :observacoes)
    end

    def resources
      @tipo_servicos = TipoServico.all
      @entidades = Entidade.all
    end
end
