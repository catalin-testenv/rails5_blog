class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  enum role: [ :commenter, :admin ]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end
end
