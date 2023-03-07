class DashboardsController < ApplicationController
  def index
    @modulos = Modulo.all
  end

  def home
  end
end
