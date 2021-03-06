class Page < ApplicationRecord

  attr_accessor :active # flag set by the outside code only in view for rendering purpose

  belongs_to :page_category, foreign_key: 'parent_id', required: false
  # without inverse_of: :page, when creating a page as:
  # Page.create(name: 'name', page_content: PageContent.new(content: 'content'))
  # it will complain that "Page content page must exist";
  # Error raised by PageContent that belongs_to Page which is required.
  has_one :page_content, dependent: :destroy, inverse_of: :page
  has_and_belongs_to_many :tags
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :page_content

  validates :name, presence: true, uniqueness: {scope: :page_category}
  validates :page_content, presence: true

  # enhances Page with comments_count method
  # preload :page_category only helps reducing db hits in admin page listing
  # TODO: comments.status is for :has_comments_having_status scope
  default_scope { preload(:page_category).joins('LEFT JOIN comments ON pages.id = comments.page_id').select('pages.*, count(comments.id) as comments_count, comments.status').group('pages.id').order(:parent_id, :ordering) }
  scope :published, -> (val=true) { where(published: val) }
  scope :for_main_menu, -> { published.where(is_main_nav: true) }
  scope :is_main_nav, -> (val=true) { where(is_main_nav: val) }
  scope :is_commentable, -> (val=true) { where(is_commentable: val) }
  scope :in_category, -> (id=nil) { where(page_category: id) if id.present?}
  scope :has_tag, -> (tag_id) { joins(:pages_tags).where(pages_tags: {tag_id: tag_id}) }
  scope :has_comments_having_status, -> (status=nil) { having( 'comments.status = ?', status) } # TODO: finish this
  scope :flt_name, -> (name) do
    where('name LIKE ?', App::Utils.sql_multi_like(name))
  end
  include ScopeUpdatedAtConcern

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

  def ordering=(val)
    super(val.present? ? val : 0)
  end

  def to_name
    name
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

end
