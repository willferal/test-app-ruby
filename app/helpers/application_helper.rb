module ApplicationHelper
  def boolean_label(expression)
    expression ? t('condicao.sim') : t('condicao.nao')
  end

  def format_datetime(datetime)
    I18n.localize(datetime, format: :medium) if datetime.present?
  end

  def select_tempo_visualizacao
    (1..72).to_a.map { |a| [a, a] }
  end
end
