
# TODO: WHY bulk_update_admin_comments/pages_path(request.query_parameters) ?
# TODO: make window alerts prettier
# TODO: in admin add social shareable (on|off) to pages
# TODO: in front let user be able to share article on social sites
# TODO: find a way to not override a user theme when main blog code is updated from repo
# TODO: ensure that ordering is respected in menu and in listings
# TODO: maybe we should be able to make any PageCategory clickable | what should be displayed in a page category view ????
# TODO: make possible to extract menu between levels (if one needs separate sub-menus)
# TODO: make an option in admin for menu_split and main_menu_depth and render secondary menu in sidebar ...?
# TODO: add more omniauth providers
# TODO: show formatted code on client - almost done
# TODO: check how to generate code view from server # http://pygments.org/docs/ | https://github.com/jneen/rouge
# TODO: add TinyMCE in front
# TODO: populate admin#home with useful stuff
# TODO: make blog real
# TODO: implement comments
# TODO: comments will be moderated (the blog owner will be notified via email)
# TODO: comments should be posted one per 5 minutes per user but can be updated once per minute per user / no more than total 10 comments per day
# TODO: pages (in admin) should be able to be filtered by is_commentable, has_unpublished_comments, has_new_comments
# TODO: make possible to have iconic pictures to PageCategories and to Page(why not)
# TODO: add add_words plugin
# TODO: make unittests
# TODO: add assets manager as an engine preferably + stuff(gallery, carousel) - think about S3
# TODO: make easy to backup/load/save entire site (db/assets)
# TODO: automate as much as possible when deploying/installing
# TODO: add help sections / document what helpers are available
# TODO: improve UI
# TODO: add robots.txt
# TODO: check ENV hanging (assets precompile) when switching envs
# TODO: add plugins/utils: contact_form, quotes...
# TODO: check mouse events (for: menu, tabs, ...) behaviour on tablets/phones
# TODO: how will user images be updated from their provider?

class UserContext
  attr_reader :user, :ctrl

  def initialize(user, ctrl)
    @user = user
    @ctrl   = ctrl
  end
end

class ApplicationController < ActionController::Base

  include Pundit
  include CommonMessagesConcern

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
    append_view_path(File.join(Rails.root, "app/themes/#{ENV['APP_THEME']}/views"))
  end

end
