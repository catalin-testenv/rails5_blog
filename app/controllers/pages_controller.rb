class PagesController < ApplicationController
  before_action :set_resource, only: [:show]

  # GET /pages/1
  def show
    authorize @resource
  end

  def root
    @resource = Page.published_root_page || Page.new(name: '', page_content_attributes: {meta_css: '', meta_js: '', content: ''})
    authorize @resource
    skip_policy_scope
    render :show
  end

  private

  def set_resource
    resource = Page.find(params[:id])
    raise ActiveRecord::RecordNotFound unless resource.published || current_user && current_user.admin?
    @resource = resource
  end

end
