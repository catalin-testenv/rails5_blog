class Comment < ApplicationRecord

  MAX_CHARS = 4096
  EXCERPT_LENGTH = 150

  enum status: [ :to_be_moderated, :rejected, :approved ]

  belongs_to :page, required: true
  belongs_to :user, required: true

  validates :content, presence: true, length: { maximum: MAX_CHARS }

  default_scope { preload(:page, :user) }
  scope :has_status, -> (val=nil) { where(status: statuses[val]) if val }
  scope :from_user, -> (name) { joins(:user).where('users.name LIKE ?', App::Utils.sql_multi_like(name)) }
  scope :for_page, -> (name) { joins(:page).where('pages.name LIKE ?', App::Utils.sql_multi_like(name)) }
  include ScopeCreatedAtConcern

  def excerpt
    content.truncate(EXCERPT_LENGTH, omission: ' ...', separator: ' ')
  end

end