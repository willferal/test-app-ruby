# encoding: utf-8
class MunicipiosController < ApplicationController
  def index
    @q = Municipio.includes(:uf).ransack(params[:q])
    @municipios = @q.result.page(params[:page])
    @ufs = Uf.all
  end
end
