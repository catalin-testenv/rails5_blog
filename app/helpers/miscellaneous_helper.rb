module MiscellaneousHelper

  def admin_body_title(title)
    "<h4 class='uk-panel-title'>#{ title }</h4>".html_safe
  end

  def admin_body_top_links(links)
    html = ''
    html << '<div><ul class="uk-subnav uk-subnav-line uk-link-unmuted">'
    html << links.map do |ln|
      %Q`<li>#{ link_to(ln[:message], ln[:path], ln[:options]) }</li>`
    end.join("\n")
    html << '</ul></div>'
    html.html_safe
  end

  def admin_body_bottom_links(links)
    html = ''
    html << '<div><ul class="uk-subnav uk-subnav-line uk-margin-bottom-remove uk-link-unmuted">'
    html << links.map do |ln|
      %Q`<li class="uk-margin-top-remove">#{ link_to(ln[:message], ln[:path], ln[:options]) }</li>`
    end.join("\n")
    html << '</ul></div>'
    html.html_safe
  end
end
