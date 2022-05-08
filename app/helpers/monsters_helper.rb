# frozen_string_literal: true

module MonstersHelper
  def stat_group(label, stat)
    content_tag(:div, '', class: 'stat-group') do
      content_tag(:label, label.titleize) + content_tag(:span, stat)
    end
  end
end
