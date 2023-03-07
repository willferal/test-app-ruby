# encoding: utf-8
class OrigensController < ApplicationController
  before_action :set_origem, only: [:show, :edit, :update, :destroy]

  def index
    @q = Origem.ransack(params[:q])
    @origens = @q.result.page(params[:page])
  end

  def show

  end

  def new
    @origem = Origem.new
  end

  def edit
  end

  def create
    @origem = Origem.new(origem_params)

    respond_to do |format|
      if @origem.save
        format.html { redirect_to origens_url, notice: I18n.t("messages.create.notice") }
        format.json { render :show, status: :created, location: @origem }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @origem.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @origem.update(origem_params)
      redirect_to origens_url, notice: t('messages.update.notice')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @origem.destroy
      redirect_to origens_url, notice: t('messages.destroy.notice')
    else
      redirect_to origens_url, alert: @origem.errors.full_messages.join(', ')
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_origem
      @origem = Origem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def origem_params
      params.require(:origem).permit(:descricao)
    end
end
