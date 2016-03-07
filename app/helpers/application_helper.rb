module ApplicationHelper

  # https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview
  # helpers for devise/sessions/new defined here after removing
  # :database_authenticatable from User (which used to provide these helpers)
  # :session_path new_session_path
  def session_path(scope)
    new_user_session_path
  end

  def new_session_path(scope)
    new_user_session_path
  end

  def evaluate(data)
    data = data.gsub(/(`\[|\]`)/, '`[' => '<%= ', ']`' => ' %>')
    ERB.new(data).result(binding)
  end
end
