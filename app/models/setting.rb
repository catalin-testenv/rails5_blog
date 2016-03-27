class Setting < ApplicationRecord

  # types: integer, float, boolean, enum, string, text

  KNOWN_NAMES = %i(
    brand_name
    tag_line
    listing_items_per_page
    inbox_email_address
    global_css
    global_javascript
    listing_blogs_per_page
    listing_comments_per_page
  )

  validates :key, presence: true, uniqueness: true
  validates_each :val do |record, attr, value|
    case record.key
      # I18n.translate('errors.messages.not_an_integer', attribute: I18n.translate(record.key))
      # record.errors.generate_message(:value, :not_an_integer)
      when 'inbox_email_address'
        record.errors.add(I18n.t("setting.key.#{record.key}"), I18n.t('errors.messages.invalid')) unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    end
  end

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