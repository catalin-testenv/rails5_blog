class Setting < ApplicationRecord

  # types: integer, float, boolean, enum, string, text

  KNOWN_NAMES = %i(
    brand_name
    tag_line
    listing_items_per_page
    inbox_email_address
    global_js
    global_css
    listing_blogs_per_page
    listing_comments_per_page
  )

  validates :key, presence: true, uniqueness: true

  default_scope { order(:group, :ordering) }

  def self.method_missing(name, *args, &block)
    if KNOWN_NAMES.include? name
      setting = find_by_key(name)
      setting.val.send(setting.cast)
    else
      super
    end
  end

end