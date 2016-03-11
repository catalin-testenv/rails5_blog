class Admin::PagesController < Admin::AdminController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  # GET /admin/pages
  # GET /admin/pages.json
  def index
    authorize Page
    @resource_list = policy_scope(Page.all)
    respond_to do |format|
      format.html do
        render :index
      end
      format.json do
        render json: @resource_list
      end
    end
  end

  # GET /admin/pages/1
  def show
    authorize @resource
    render :edit
  end

  # GET /admin/pages/new
  def new
    @resource = Page.new
    authorize @resource
  end

  # GET /admin/pages/1/edit
  # GET /admin/pages/1/edit.json
  def edit
    authorize @resource
    respond_to do |format|
      format.html do
        render :edit
      end
      format.json do
        render json: @resource.attributes.merge(
          page_categories_all: PageCategory.all.each.with_object({0 => 'root'}){ |p, h|  h[p.id] = p.name }
        )
      end
    end
  end

  # POST /admin/pages
  # POST /admin/pages.json
  def create
    @resource = Page.new(resource_params)
    authorize @resource
    respond_to do |format|
      if @resource.save
        format.html do
          flash.now[:notice] = resource_creation_success_message(resource_instance: @resource)
          render :edit
        end
        format.json do
          render json: @resource, status: :created, location: @resource
        end
      else
        format.html do
          flash.now[:alert] = resource_creation_failed_message(resource_instance: @resource)
          render :new
        end
        format.json do
          render json: @resource.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /admin/pages/1
  # PATCH/PUT /admin/pages/1.json
  def update
    authorize @resource
    respond_to do |format|
      if @resource.update(resource_params)
        format.html do
          flash.now[:notice] = resource_update_success_message(resource_instance: @resource)
          render :edit
        end
        format.json do
          render json: @resource.attributes.merge(
              page_categories_all: PageCategory.all.each.with_object({0 => 'root'}){ |p, h|  h[p.id] = p.name }
          ), status: :ok, location: @resource
        end
      else
        format.html do
          flash.now[:alert] = resource_update_failed_message(resource_instance: @resource)
          render :edit
        end
        format.json do
          render json: @resource.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /admin/pages/1
  # DELETE /admin/pages/1.json
  def destroy
    authorize @resource
    @resource.destroy
    respond_to do |format|
      format.html do
        redirect_to admin_pages_url, notice: resource_destroy_success_message(resource_instance: @resource)
      end
      format.json do
        head :no_content
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_resource
    @resource = Page.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def resource_params
    params.require(:page).permit(:name, :content,
                                 :meta_description, :excerpt,
                                 :meta_css, :meta_js, :is_main_nav,
                                 :is_commentable, :max_comments, :published, :root_page,
                                 :parent_id, :ordering
                                  )
  end
end
