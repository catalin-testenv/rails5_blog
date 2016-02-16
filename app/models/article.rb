class Article < ApplicationRecord

  MAX_META = 150

  validates :title, presence: true
  validates :content, presence: true
  validates :meta_description, length: { maximum: MAX_META }
  validates :excerpt, length: { maximum: MAX_META }

  def to_name
    title
  end
  def to_param
    "#{id}-#{title.parameterize}"
  end
end
