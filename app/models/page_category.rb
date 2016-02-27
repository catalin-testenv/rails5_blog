class PageCategory < ApplicationRecord

  attr_accessor :active

  has_many :pages, foreign_key: :parent_id
  has_many :children, foreign_key: :parent_id, class_name: 'PageCategory'
  belongs_to :parent, class_name: 'PageCategory', required: false

  default_scope { order(:parent_id, :ordering) }

  def has_sub_categories?
    children.count > 0
  end

  def has_nav_pages?
    pages.to_a.any?(&:is_main_nav)
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
