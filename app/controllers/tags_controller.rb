class TagsController < ApplicationController
  before_action :set_resource, only: [:show]

  # GET /tags/1
  def show
    authorize @resource
  end

  private

  def set_resource
    @resource = Tag.find(params[:id])
  end

end
