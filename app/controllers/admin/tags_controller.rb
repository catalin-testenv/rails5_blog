class Admin::TagsController < Admin::AdminController

  before_action :set_resource, only: [:update, :destroy]

  def index
    authorize Tag
    skip_policy_scope
    @resource_list = Tag.all
  end

  # POST /admin/tags
  def create
    @resource = Tag.new(resource_params)
    authorize @resource
    respond_to do |format|
      if @resource.save
        format.html do
          redirect_to admin_tags_path, notice: resource_creation_success_message(resource_instance: @resource)
        end
      else
        format.html do
          redirect_to admin_tags_path, alert: resource_creation_failed_message(resource_instance: @resource) + "(#{@resource.errors.full_messages.join(', ')})"
        end
      end
    end
  end

  # PATCH/PUT /admin/tags/1
  def update
    authorize @resource
    respond_to do |format|
      if @resource.update(resource_params)
        format.html do
          redirect_to admin_tags_path, notice: resource_update_success_message(resource_instance: @resource)
        end
      else
        format.html do
          redirect_to admin_tags_path, alert: resource_update_failed_message(resource_instance: @resource) + "(#{@resource.errors.full_messages.join(', ')})"
        end
      end
    end
  end

  # DELETE /admin/tags/1
  def destroy
    authorize @resource
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to admin_tags_path, notice: resource_destroy_success_message(resource_instance: @resource) }
    end
  end

  private

  def set_resource
    @resource = Tag.find(params[:id])
  end

  def resource_params
    params
        .require(:tag)
        .permit(:name)
  end


end
