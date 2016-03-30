class Tag < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  has_and_belongs_to_many :pages

  default_scope { order(:name) }

  def to_name
    name
  end

  def has_any_pages?
    pages.count > 0
  end
end