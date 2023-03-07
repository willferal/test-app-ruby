# frozen_string_literal: true
require 'csv'

class PopulateMunicipios < ActiveRecord::Migration[7.0]
  MUNICIPIOS_PATH = Rails.root.join('db/municipios.csv')

  def up
    ufs_map = Uf.pluck(:sigla, :id).to_h

    CSV.foreach(MUNICIPIOS_PATH, headers: true, col_sep: ";") do |row|
      hash = row.to_h

      Municipio.create(
        descricao: hash["MUNICÍPIO - IBGE"],
        uf_id: ufs_map[hash["UF"]]
      )
    end
  end

  def down
    Municipio.delete_all
  end
end
