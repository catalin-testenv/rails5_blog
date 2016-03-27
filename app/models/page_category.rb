class PageCategory < ApplicationRecord

  attr_accessor :active

  has_many :pages, foreign_key: :parent_id
  has_many :subcategories, foreign_key: :parent_id, class_name: 'PageCategory'
  belongs_to :parent, class_name: 'PageCategory', required: false

  before_destroy :move_children

  validates :name, presence: true, uniqueness: {scope: :parent}

  default_scope { order(:parent_id, :ordering) }

  def children
    (pages + subcategories).sort_by { |item| [item.parent_id.to_i, item.ordering.to_i] }
  end

  def move_children
    pages.update_all(parent_id: parent.try(:id) || 0)
    subcategories.update_all(parent_id: parent.try(:id) || 0)
  end

  def has_subcategories?
    subcategories.count > 0
  end

  def has_any_pages?
    pages.count > 0
  end

  def has_nav_pages?
    pages.to_a.any?(&:is_main_nav)
  end

  def ordering=(val)
    super(val.present? ? val : 0)
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def to_name
    name
  end
end
