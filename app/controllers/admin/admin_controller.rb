class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  # http://apidock.com/rails/ActionController/Layout/ClassMethods/layout
  layout 'admin/layouts/admin'
end
