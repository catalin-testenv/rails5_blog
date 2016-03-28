class Admin::PageCategoriesController < Admin::AdminController
  before_action :set_resource, only: [:update, :destroy]

  # GET /admin/page_categories
  def index
    authorize PageCategory
    @resource_list = policy_scope(PageCategory.all)
  end

  # POST /admin/page_categories
  def create
    @resource = PageCategory.new(resource_params)
    authorize @resource
    respond_to do |format|
      if @resource.save
        format.html do
          redirect_to admin_page_categories_path, notice: resource_creation_success_message(resource_instance: @resource)
        end
      else
        format.html do
          redirect_to admin_page_categories_path, alert: resource_creation_failed_message(resource_instance: @resource) + "(#{@resource.errors.full_messages.join(', ')})"
        end
      end
    end
  end

  # PATCH/PUT /admin/page_categories/1
  def update
    authorize @resource
    respond_to do |format|
      if @resource.update(resource_params)
        format.html do
          redirect_to admin_page_categories_path, notice: resource_update_success_message(resource_instance: @resource)
        end
      else
        format.html do
          redirect_to admin_page_categories_path, alert: resource_update_failed_message(resource_instance: @resource) + "(#{@resource.errors.full_messages.join(', ')})"
        end
      end
    end
  end

  # DELETE /admin/page_categories/1
  def destroy
    authorize @resource
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to admin_page_categories_path, notice: resource_destroy_success_message(resource_instance: @resource) }
    end
  end

  private

  def set_resource
    @resource = PageCategory.find(params[:id])
  end

  def resource_params
    params
      .require(:page_category)
      .permit(:name, :parent_id, :ordering)
  end

end
