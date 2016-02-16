class Article < ApplicationRecord
  def to_name
    title
  end
  def to_param
    "#{id}-#{title.parameterize}"
  end
end
