# encoding: utf-8
class UfsController < ApplicationController
  def index
    @q = Uf.ransack(params[:q])
    @ufs = @q.result.page(params[:page])
  end
end
