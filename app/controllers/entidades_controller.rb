# encoding: utf-8
class EntidadesController < ApplicationController
  before_action :set_entidade, only: [:show, :edit, :update, :destroy]
  before_action :resources, only: [:index, :new, :create, :edit, :update]
  before_action :set_municipios, only: [:new, :create, :edit, :update]

  def index
    @q = Entidade.ransack(params[:q])
    @entidades = @q.result.page(params[:page])
  end

  def show

  end

  def new
    @entidade = Entidade.new
  end

  def edit
  end

  def create
    @entidade = Entidade.new(entidade_params)

    respond_to do |format|
      if @entidade.save
        format.html { redirect_to entidades_url, notice: I18n.t("messages.create.notice") }
        format.json { render :show, status: :created, location: @entidade }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entidade.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @entidade.update(entidade_params)
      redirect_to entidades_url, notice: t('messages.update.notice')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @entidade.destroy
      redirect_to entidades_url, notice: t('messages.destroy.notice')
    else
      redirect_to entidades_url, alert: @entidade.errors.full_messages.join(', ')
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entidade
      @entidade = Entidade.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def entidade_params
      params.require(:entidade).permit(:nome, :cpf_cnpj, :razao_social, :endereco, :numero_endereco, :complemento_endereco, :bairro_endereco, :municipio_id, :tipo_entidade_id, :origem_id, atuacao_ids: [])
    end

    def resources
      @origens = Origem.all
      @tipo_entidades = TipoEntidade.all
      @atuacoes = Atuacao.all
    end

    def set_municipios
      @municipios = Municipio.only_from('CE')
    end
end
