class Admin::LayoutRegionsController < Admin::AdminController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  # GET /admin/layout_regions
  def index
    authorize LayoutRegion
    @resource_list = list_ops_sort(policy_scope(LayoutRegion.all))
  end

  # GET /admin/layout_regions/1
  def show
    authorize @resource
    render :edit
  end

  # GET /admin/layout_regions/new
  def new
    @resource = LayoutRegion.new()
    authorize @resource
  end

  # GET /admin/layout_regions/1/edit
  def edit
    authorize @resource
  end

  # POST /admin/layout_regions
  def create
    @resource = LayoutRegion.new(resource_params)
    authorize @resource
    respond_to do |format|
      if @resource.save
        format.html do
          flash.now[:notice] = resource_creation_success_message(resource_instance: @resource)
          render :edit
        end
      else
        format.html do
          flash.now[:alert] = resource_creation_failed_message(resource_instance: @resource)
          render :new
        end
      end
    end
  end

  # PATCH/PUT /admin/layout_regions/1
  def update
    authorize @resource
    respond_to do |format|
      if @resource.update(resource_params)
        format.html do
          flash.now[:notice] = resource_update_success_message(resource_instance: @resource)
          render :edit
        end
      else
        format.html do
          flash.now[:alert] = resource_update_failed_message(resource_instance: @resource)
          render :edit
        end
      end
    end
  end


  # DELETE /admin/pages/1
  def destroy
    authorize @resource
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to admin_layout_regions_path, notice: resource_destroy_success_message(resource_instance: @resource) }
    end
  end

  private

  def set_resource
    @resource = LayoutRegion.find(params[:id])
  end

  def resource_params
    params
      .require(:layout_region)
      .permit(:name, :content)
  end

end
