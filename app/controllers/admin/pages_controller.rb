class Admin::PagesController < Admin::AdminController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  # GET /admin/pages
  def index
    authorize Page
    @resource_list = policy_scope(Page.all)
  end

  # GET /admin/pages/1
  def show
    authorize @resource
    render :edit
  end

  # GET /admin/pages/new
  def new
    @resource = Page.new(page_content_attributes: {})
    authorize @resource
  end

  # GET /admin/pages/1/edit
  def edit
    authorize @resource
  end

  # POST /admin/pages
  def create
    @resource = Page.new(resource_params)
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

  # PATCH/PUT /admin/pages/1
  def update
    authorize @resource
    respond_to do |format|
      if @resource.update(resource_params)
        format.html do
          flash.now[:notice] = resource_update_success_message(resource_instance: @resource)
          render :edit
        end
      else
        # @resource.errors[:base] << 'some error' << 'some other error'
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
      format.html { redirect_to admin_pages_url, notice: resource_destroy_success_message(resource_instance: @resource) }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_resource
    @resource = Page.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def resource_params
    params.require(:page).permit(:name, :is_main_nav,
                                 :is_commentable, :max_comments, :published, :root_page,
                                 :parent_id, :ordering,
                                 page_content_attributes: [
                                     :id, :content, :excerpt,
                                     :meta_description, :meta_css, :meta_js
                                 ]
    )
  end
end
