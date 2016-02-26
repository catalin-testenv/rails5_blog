class PageCategoriesController < ApplicationController
  before_action :set_resource, only: [:show]

  # GET /page_categories/1
  def show
    authorize @resource
  end

  private

  def set_resource
    @resource = PageCategory.find(params[:id])
  end

end
