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
    # allow quick `[ruby_code_here]`
    data = data.gsub(/(`\[|\]`)/, '`[' => '<%= ', ']`' => ' %>')
    # ERB.new(data).result(binding) # this doesn't work with blocks in some cases
    # http://stackoverflow.com/questions/27465389/error-compiling-erb-code-from-string
    # http://stackoverflow.com/questions/17374274/why-is-this-an-error-with-erb
    # but this works
    capture do
      ActionView::Template::Handlers::Erubis.new(data).result(binding)
    end
  end
end
