class Comment < ApplicationRecord

  MAX_CHARS = 4096
  EXCERPT_LENGTH = 60

  enum status: [ :pending, :rejected, :approved ]

  belongs_to :page, required: true
  belongs_to :user, required: true

  validates :content, presence: true, length: { maximum: MAX_CHARS }

  default_scope { preload(:page, :user) }
  scope :has_status, -> (status) { where status: statuses[status] }
  scope :from_user, -> (id) { where user: id }
  scope :for_page, -> (id) { where page: id }
  include ScopeCreatedAtConcern

  # used in admin comment list
  def excerpt
    ActionController::Base.helpers.strip_tags(content).truncate(EXCERPT_LENGTH, omission: ' ...', separator: ' ')
  end

  # used in front page show comment list
  # http://stackoverflow.com/questions/4320160/is-there-an-html-safe-truncate-method-in-rails#comment-56004681
  def content!
    ActionController::Base.helpers.sanitize( # for tag completion
        ActionController::Base.helpers.sanitize( # for tag/attrs permission
            content, tags: %w|a dl ul ol li p i b pre|, attributes: %w|href|
        )
    )
  end

  # used in admin comment CRUD notice/alert
  def to_name
    excerpt
  end

end