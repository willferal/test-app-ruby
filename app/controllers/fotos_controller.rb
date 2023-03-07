# encoding: utf-8
class FotosController < ApplicationController
  before_action :set_foto, only: [:show, :edit, :update, :destroy]

  def index
    @q = Foto.ransack(params[:q])
    @fotos = @q.result.page(params[:page])
  end

  def show

  end

  def new
    @foto = Foto.new
  end

  def edit
  end

  def create
    # TODO melhorar essa validacao if
    @token = ServicoFileWs.get_upload_arquivo_ws(foto_params[:nome_arquivo]) if foto_params[:nome_arquivo].present?

    @foto_params = foto_params
    @foto_params[:nome_arquivo] = foto_params[:nome_arquivo].original_filename if foto_params[:nome_arquivo].present?
    @foto_params[:token] = @token['token'] if @token.present?

    @foto = Foto.new(@foto_params)
    @fotos = @foto.servico.fotos.page(params[:page])
    respond_to do |format|
      if @foto.save
        format.html { redirect_to servico_path(@foto.servico_id), notice: I18n.t("messages.create.notice") }
      else
        format.html { redirect_to servico_path(@foto.servico_id), alert: 'Favor informar os campos obrigatórios.'  }
      end
    end
  end

  def update
    if @foto.update(foto_params)
      redirect_to fotos_url, notice: t('messages.update.notice')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    servico_id = @foto.servico_id
    @fotos = @foto.servico.fotos.page(params[:page])
    respond_to do |format|
      if @foto.destroy
        format.turbo_stream do
          flash.now[:notice] = t('messages.destroy.notice')
        end
        format.html do
          redirect_to servico_path(servico_id), notice: t('messages.destroy.notice')
        end
        format.json { head :no_content }
      else
        format.turbo_stream do
          flash.now[:error] = @foto.errors.full_messages.join(', ')
        end
        format.html do
          flash[:error] = @foto.errors.full_messages.join(', ')
          redirect_to servico_path(servico_id), status: :unprocessable_entity
        end
        format.json { head :no_content }
      end
    end
  end

  def download
    foto = Foto.find(params[:id])
    arquivo = ServicoFileWs.get_download_arquivo_ws(foto.token)
    send_data arquivo, disposition: 'attachment', filename: foto.nome_arquivo
  end

  def sort_fotos
    @foto = Foto.find(params[:id])
    @foto.insert_at(params[:position].to_i)
    head :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foto
      @foto = Foto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def foto_params
      params.require(:foto).permit(:nome_arquivo, :principal, :token, :servico_id, :titulo)
    end
end
