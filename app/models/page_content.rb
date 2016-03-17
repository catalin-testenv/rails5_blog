class PageContent < ApplicationRecord

  MAX_META = 150
  EXCERPT_LENGTH = 150

  belongs_to :page, required: true

  validates :content, presence: true
  validates :meta_description, length: { maximum: MAX_META }
  validates :excerpt, length: { maximum: MAX_META }

  def excerpt
    res = super
    return res if res && res.length > 0
    (content || '').truncate(EXCERPT_LENGTH, omission: ' ...', separator: ' ')
  end

end
