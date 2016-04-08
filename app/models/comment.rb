class Comment < ApplicationRecord

  MAX_CHARS = 4096
  EXCERPT_LENGTH = 150
  TO_NAME_LENGTH = 150

  enum status: [ :pending, :rejected, :approved ]

  belongs_to :page, required: true
  belongs_to :user, required: true

  validates :content, presence: true, length: { maximum: MAX_CHARS }

  default_scope { preload(:page, :user) }
  scope :has_status, -> (status) { where status: statuses[status] }
  scope :from_user, -> (id) { where user: id }
  scope :for_page, -> (id) { where page: id }
  include ScopeCreatedAtConcern

  def excerpt
    content.truncate(EXCERPT_LENGTH, omission: ' ...', separator: ' ')
  end

  def to_name
    content.truncate(TO_NAME_LENGTH, omission: ' ...', separator: ' ')
  end

end