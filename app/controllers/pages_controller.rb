class PagesController < ApplicationController
  before_action :set_resource, only: [:show]

  # GET /pages/1
  def show
    authorize @resource
  end

  private

  def set_resource
    @resource = Page.find(params[:id])
  end

end
