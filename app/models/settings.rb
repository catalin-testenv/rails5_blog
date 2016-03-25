class Settings < ApplicationRecord

  MAX_COMMENTS = 20

  def self.max_comments
    find_by_key(:max_comments).try(:val).to_i || MAX_COMMENTS
  end

end