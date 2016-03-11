class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  after_action :set_csrf_cookie

  # http://apidock.com/rails/ActionController/Layout/ClassMethods/layout
  layout 'admin/layouts/admin'

  private

  def set_csrf_cookie
    cookies['X-CSRF-Token'] = "xxx-#{form_authenticity_token}"
  end

  def verified_request?
    super || valid_authenticity_token?(session, request.headers['X-CSRF-Token'])
  end

end
