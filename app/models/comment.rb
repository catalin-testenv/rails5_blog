class Comment < ApplicationRecord

  MAX_CHARS = 4096

  enum status: [ :to_be_moderated, :rejected, :approved ]

  belongs_to :page, required: true
  belongs_to :user, required: true

  validates :content, presence: true, length: { maximum: MAX_CHARS }

end