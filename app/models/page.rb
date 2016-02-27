class Page < ApplicationRecord

  attr_accessor :active

  MAX_META = 150
  EXCERPT_LENGTH = 100

  belongs_to :page_category, foreign_key: 'parent_id', required: false

  validates :name, presence: true
  validates :content, presence: true
  validates :meta_description, length: { maximum: MAX_META }
  validates :excerpt, length: { maximum: MAX_META }

  default_scope { order(:parent_id, :ordering) }
  scope :published, -> { where(published: true) }
  scope :for_main_menu, -> { published.where(is_main_nav: true) }

  def self.published_root_page
    found = root_page
    found if found.try(:published?)
  end

  def self.root_page
    find_by root_page: true
  end

  def root_page=(set_as_root)
    set_as_root = set_as_root.to_bool
    found_root_page = Page.root_page
    current_root_page_id = found_root_page.try(:id)
    if current_root_page_id && set_as_root
      if id.nil? || id && current_root_page_id != id
        found_root_page.update(root_page: false)
      end
    end
    super
  end

  def excerpt
    res = super
    return res if res && res.length > 0
    content[0..EXCERPT_LENGTH]
  end

  def to_name
    name
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

end
