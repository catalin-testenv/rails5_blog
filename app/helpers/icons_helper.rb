module IconsHelper

  def icon_actions(options='')
    "<i class='fa fa-cog #{options}'></i>".html_safe
  end

  def icon_title(options='')
    "<i class='fa fa-flag #{options}'></i>".html_safe
  end

  def icon_home_page(options='')
    "<i class='fa fa-home #{options}'></i>".html_safe
  end

  def icon_is_main_nav(options='')
    "<i class='fa fa-sitemap #{options}'></i>".html_safe
  end

  def icon_published(options='')
    "<i class='fa fa-cloud-upload #{options}'></i>".html_safe
  end

  def icon_is_commentable(options='')
    "<i class='fa fa-comments #{options}'></i>".html_safe
  end

  def icon_ordering(options='')
    "<i class='fa fa-sort-numeric-asc #{options}'></i>".html_safe
  end

  def icon_page_category(options='')
    "<i class='fa fa-folder-o #{options}'></i>".html_safe
  end

  def icon_updated_at(options='')
    "<i class='fa fa-calendar #{options}'></i>".html_safe
  end

  def icon_edit(options='')
    "<i class='fa fa-pencil-square-o #{options}'></i>".html_safe
  end

  def icon_destroy(options='')
    "<i class='fa fa-trash-o #{options}'></i>&nbsp;".html_safe
  end

  def icon_new(options='')
    "<i class='fa fa-file-o #{options}'></i>".html_safe
  end

  def icon_list(options='')
    "<i class='fa fa-list #{options}'></i>".html_safe
  end

  def icon_preview(options='')
    "<i class='fa fa-eye #{options}'></i>".html_safe
  end

  def icon_filter(options='')
    "<i class='fa fa-filter #{options}'></i>".html_safe
  end

  def icon_save(options='')
    "<i class='fa fa-save #{options}'></i>".html_safe
  end

  def icon_cancel(options='')
    "<i class='fa fa-arrow-left #{options}'></i>".html_safe
  end

  def icon_tag(options='')
    "<i class='fa fa-tags #{options}'></i>".html_safe
  end

end
