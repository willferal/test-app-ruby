class GenerateDataJob < ApplicationJob
  queue_as :default

  def perform(indicador)
    indicador.process_value
  end
end