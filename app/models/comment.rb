class Comment < ApplicationRecord

  MAX_CHARS = 4096
  EXCERPT_LENGTH = 150

  enum status: [ :to_be_moderated, :rejected, :approved ]

  belongs_to :page, required: true
  belongs_to :user, required: true

  validates :content, presence: true, length: { maximum: MAX_CHARS }

  def excerpt
    content.truncate(EXCERPT_LENGTH, omission: ' ...', separator: ' ')
  end

end