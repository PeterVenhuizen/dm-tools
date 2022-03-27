module MonstersHelper
  def stat_group(label, stat)
    "<div class='stat-group'>\
    <label class='has-text-weight-bold'>#{label.titleize}</label>\
    <span>#{stat}</span></div>".html_safe
  end
end
