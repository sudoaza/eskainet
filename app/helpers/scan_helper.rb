module ScanHelper
  def state_label(state)
    if state == 'completed'
      label = '<span class="state label label-success">completed</span>'
    elsif state == 'running'
      label = '<span class="state label label-info">running</span>'
    elsif state == 'failed'
      label = '<span class="state label label-danger">failed<span>'
    else
      label = "<span class=\"state label label-default\">#{state}</span>"
    end
    raw(label)
  end
end
