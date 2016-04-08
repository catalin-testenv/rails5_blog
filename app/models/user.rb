class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  enum role: [ :commenter, :admin ]

  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :email, uniqueness: true, allow_blank: true

  # enhances User with comments_count method
  default_scope { joins('LEFT JOIN comments ON users.id = comments.user_id').select('users.*, count(comments.id) as comments_count').group('users.id').order(created_at: :asc) }
  scope :flt_name, ->(name) do
    where('name LIKE ?', App::Utils.sql_multi_like(name))
  end
  include ScopeCreatedAtConcern

  before_create do |user|
    user.role = :admin if User.unscoped.count == 0
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end

  def image!
    img = image
    img.present? ? img : ActionController::Base.helpers.image_path('icon_user_default.png')
  end

  def to_name
    name
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
