ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html = %(<div class="field_with_errors">#{html_tag}</div>).html_safe

  form_fields = [
      'textarea',
      'input',
      'select'
  ]

  elements = Nokogiri::HTML::DocumentFragment.parse(html_tag).css "label, " + form_fields.join(', ')

  elements.each do |e|
    if e.node_name.eql? 'label'
      html = %(<div class="block text-sm font-medium text-red-700 dark:text-red-500">#{e}</div>).html_safe
    elsif form_fields.include? e.node_name and html_tag.exclude? 'type="hidden"'
      html_tag = html_tag.gsub("validation", "validation bg-red-50 border border-red-500 text-red-900 placeholder-red-700 text-sm rounded-lg focus:ring-red-500 focus:border-red-500 block dark:bg-red-100 dark:border-red-400").html_safe
      html = %(#{html_tag}<p class="text-sm text-red-600 dark:text-red-500">&nbsp;#{instance.error_message&.first}</p>).html_safe
      # if instance.error_message.kind_of?(Array)
      #   # html = %(<div class="ui form field error">#{html_tag}<div class="ui error message"><p>#{instance.error_message&.first}</p></div></div>).html_safe
      #   html = %(<div class="ui form field error">#{html_tag}</div>).html_safe
      # else
      #   # html = %(<div class="ui form field error">#{html_tag}<div class="ui error message"><p>#{instance.error_message&.first}</p></div></div>).html_safe
      #   html = %(<div class="ui form field error">#{html_tag}</div>).html_safe
      # end
    end
  end
  html
end