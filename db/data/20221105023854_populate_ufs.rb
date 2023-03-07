# frozen_string_literal: true
require 'csv'

class PopulateUfs < ActiveRecord::Migration[7.0]
  UFS_PATH = Rails.root.join('db/ufs.csv')

  def up
    CSV.foreach(UFS_PATH, headers: true, col_sep: ";") do |row|
      Uf.create(row.to_h)
    end
  end

  def down
    Uf.delete_all
  end
end
