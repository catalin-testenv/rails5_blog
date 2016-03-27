class Tag < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  has_and_belongs_to_many :pages

  def to_name
    name
  end
end