
class PageContent < ApplicationRecord

  MAX_META = 150
  EXCERPT_LENGTH = 250

  include ActionView::Helpers::CaptureHelper
  include ActionView::Context
  include ApplicationHelper # requires CaptureHelper, Context included before

  belongs_to :page, required: true

  validates :content, presence: true
  validates :meta_description, length: { maximum: MAX_META }
  validates :excerpt, length: { maximum: MAX_META }

  def content!
    evaluate(content)
  end

  def excerpt!
    res = excerpt
    return evaluate(res) if res.present?
    html = (content || '').truncate(EXCERPT_LENGTH, omission: ' ...', separator: ' ')
    evaluate(html)
  end


end
