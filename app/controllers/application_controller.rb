
# TODO: let user be able to share article on social sites
# TODO: check how to generate code view from server # http://pygments.org/docs/

class UserContext
  attr_reader :user, :ctrl

  def initialize(user, ctrl)
    @user = user
    @ctrl   = ctrl
  end
end

class ApplicationController < ActionController::Base

  include Pundit
  include CommonMessages

  # before_action :authenticate_user!
  before_action :set_locale, :add_theme_support

  after_action :verify_authorized, unless: -> (controller) do
    controller.is_a? DeviseController
  end

  after_action :verify_policy_scoped,
    except: [:show, :new, :edit,
            :create, :update, :destroy],
    unless: -> (controller) do
      controller.is_a? DeviseController
    end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def get_locale
    @_locale ||= ENV['APP_LOCALE']
  end

  # https://github.com/elabs/pundit#additional-context
  def pundit_user
    UserContext.new(current_user, self)
  end

  private

  def set_locale
    I18n.locale = get_locale
  end

  def user_not_authorized
    flash[:alert] = authorization_failure_message
    redirect_to(current_user ? root_path : new_user_session_path)
  end

  def add_theme_support
    @current_theme = ENV['APP_THEME']
    append_view_path(File.join(Rails.root, "app/themes/#{@current_theme}"))
    append_view_path(File.join(Rails.root, 'app/themes/base'))
  end

end
