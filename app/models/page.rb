class Page < ApplicationRecord

  MAX_META = 150
  SETTINGS_ROOT_PAGE = 'root_page'

  validates :title, presence: true
  validates :content, presence: true
  validates :meta_description, length: { maximum: MAX_META }
  validates :excerpt, length: { maximum: MAX_META }

  scope :published, -> { where(published: true) }
  scope :for_main_menu, -> { published.where(is_main_nav: true) }

  def self.published_root_page
    found = root_page
    found if found.try(:published?)
  end

  def self.root_page
    find_by id: Settings.find_by(key: SETTINGS_ROOT_PAGE).try(:val).to_i
  end

  def root_page
    id == self.class.root_page.try(:id)
  end

  def root_page?
    root_page
  end

  def root_page=(set_as_root)
    entry = Settings.find_or_create_by(key: SETTINGS_ROOT_PAGE)
    entry.update({val: if set_as_root == '1'
                         id # set ourselves as root page
                       elsif id == entry.val.to_i # if we're editing ourselves
                         -1 # let root page be none
                       else
                         entry.val # let root page be as before
                       end})
  end

  def to_name
    title
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end

end
