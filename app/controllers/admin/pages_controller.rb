class Admin::PagesController < Admin::AdminController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  # GET /pages
  def index
    authorize Page
    @resource_list = policy_scope(Page.all)
  end

  # GET /pages/1
  def show
    authorize @resource
  end

  # GET /pages/new
  def new
    @resource = Page.new
    authorize @resource
  end

  # GET /pages/1/edit
  def edit
    authorize @resource
  end

  # POST /pages
  def create
    @resource = Page.new(resource_params)
    authorize @resource
    respond_to do |format|
      if @resource.save
        format.html { redirect_to admin_page_path(@resource),
                                  notice: resource_creation_success_message(resource_instance: @resource) }
      else
        format.html {
          flash.now[:alert] = resource_creation_failed_message(resource_instance: @resource)
          render :new
        }
      end
    end
  end

  # PATCH/PUT /pages/1
  def update
    authorize @resource
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to admin_page_path(@resource), notice: resource_update_success_message(resource_instance: @resource) }
      else
        # @resource.errors[:base] << 'some error' << 'some other error'
        format.html {
          flash.now[:alert] = resource_update_failed_message(resource_instance: @resource)
          render :edit
        }
      end
    end
  end

  # DELETE /pages/1
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
      params.require(:page).permit(:title, :meta_description, :excerpt, :content)
    end
end
