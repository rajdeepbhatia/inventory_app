module ApplicationHelper
  def bootstrap_class_for flash_type=nil
    case flash_type.to_s
      when 'success'
        'alert-success'
      when 'error'
        'alert-danger'
      when 'alert'
        'alert-warning'
      when 'notice'
        'alert-info'
      else
        flash_type.to_s
    end
  end

  def restrict_length(string, length=12)
    string.to_s.truncate(length, omission: '..')
  end

  def flash_message(message, klass)
    unless message.blank?
      "<div class=\"alert #{klass}\">#{message}<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button></div>".html_safe
    end
  end

  def history_type(allotted)
    if allotted
      'Allotted'
    else
      'Deallotted'
    end
  end
end
