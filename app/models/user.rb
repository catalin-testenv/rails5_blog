class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  enum role: [ :commenter, :admin ]

  has_many :comments, dependent: :destroy

  # enhances User with comments_count method
  default_scope { joins(:comments).select('users.*, count(comments.id) as comments_count').group('users.id').order(created_at: :asc) }
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
end
