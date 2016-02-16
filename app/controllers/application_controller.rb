
class ApplicationController < ActionController::Base

  include Pundit
  include CommonMessages

  # before_action :authenticate_user!
  before_action :set_locale

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

  def set_locale
    I18n.locale = ENV['APP_LOCALE']
  end

  private

  def user_not_authorized
    flash[:alert] = authorization_failure_message
    redirect_to(request.referrer || root_path)
  end
end
