class LayoutRegion < ApplicationRecord
  DEFAULTS = %w|
    before_site_content before_site_footer before_site_header before_site_main_navigation
    sidebar_left sidebar_right site_footer site_header
  |
  validates :name, presence: true

  def default?
    DEFAULTS.include? name
  end

  def to_name
    name
  end
end