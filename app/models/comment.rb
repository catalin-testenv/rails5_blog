class Comment < ApplicationRecord

  MAX_CHARS = 4096
  EXCERPT_LENGTH = 150

  enum status: [ :to_be_moderated, :rejected, :approved ]

  belongs_to :page, required: true
  belongs_to :user, required: true

  validates :content, presence: true, length: { maximum: MAX_CHARS }

  scope :approved, -> () { where(status: statuses[:approved]) }
  scope :to_be_moderated, -> () { where(status: statuses[:to_be_moderated]) }
  scope :rejected, -> () { where(status: statuses[:rejected]) }
  scope :of_user, ->(name) do
    joins(:user).where('users.name LIKE ?', App::Utils.sql_multi_like(name))
  end
  include ScopeCreatedAtConcern

  def excerpt
    content.truncate(EXCERPT_LENGTH, omission: ' ...', separator: ' ')
  end

end