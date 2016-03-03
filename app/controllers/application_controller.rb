
# TODO: add will-paginate on index pages
# TODO: find a way to dynamically load js/css per admin/site and theme |eventually put templates in DB ?
# TODO: find a way to not override a user theme when main blog code is updated from repo
# TODO: should be excluded from PageCategory show listing those pages for main nav?
# TODO: ensure that ordering is respected in menu and in listings
# TODO: maybe we should be able to make any PageCategory clickable | what should be displayed in a page category view ????
# TODO: make possible to extract menu between levels (if one needs separate sub-menus)
# TODO: add page_category editor
# TODO: add more omniauth providers
# TODO: let user be able to share article on social sites
# TODO: show formatted code on client - almost done
# TODO: check how to generate code view from server # http://pygments.org/docs/ | https://github.com/jneen/rouge
# TODO: add TinyMCE option
# TODO: populate admin#home with useful stuff
# TODO: there should be a settings controller/model for some general customizations
# TODO: implement comments
# TODO: make possible to have iconic pictures to PageCategories and to Page(why not)
# TODO: make blog real
# TODO: move page content/js/css into separate table for performance reasons
# TODO: implement layout regions
# TODO: make unittests
# TODO: add assets manager as an engine preferably + stuff(gallery, carousel)
# TODO: make easy to backup/load/save entire site (db/assets)
# TODO: automate as much as possible when deploying/installing
# TODO: add help sections / document what helpers are available
# TODO: improve UI
# TODO: try ui-kit and use it in UI
# TODO: check ENV hanging (assets precompile) when switching envs
# TODO: add plugins/utils: contact_form, ...
# TODO: add quotes module
# TODO: check mouse events (for: menu, tabs, ...) behaviour on tablets/phones

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
