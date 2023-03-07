module FlashHelper
  def classes_for_flash(flash_key)
    case flash_key.to_sym
    when :notice, :success
      'bg-green-100 text-green-700'
    when :error, :danger
      'bg-red-100 text-red-700'
    when :alert, :warning
      'bg-yellow-100 text-yellow-700'
    when :primary
      'bg-blue-100 text-blue-700'
    end
  end
  
end


