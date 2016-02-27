class PageCategory < ApplicationRecord

  attr_accessor :active

  has_many :pages, foreign_key: :parent_id
  has_many :subcategories, foreign_key: :parent_id, class_name: 'PageCategory'
  belongs_to :parent, class_name: 'PageCategory', required: false

  default_scope { order(:parent_id, :ordering) }

  def children
    (pages + subcategories).sort_by { |item| [item.parent_id.to_i, item.ordering.to_i] }
  end

  def has_subcategories?
    subcategories.count > 0
  end

  def has_nav_pages?
    pages.to_a.any?(&:is_main_nav)
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
