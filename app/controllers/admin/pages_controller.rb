class Admin::PagesController < Admin::AdminController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  has_scope :flt_name
  has_scope :published
  has_scope :is_main_nav
  has_scope :is_commentable
  has_scope :in_category
  include HasScopeUpdatedAtConcern


  # GET /admin/pages
  def index
    authorize Page
    @resource_list = list_ops_sort(policy_scope(apply_scopes(Page).all))
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

  def bulk_update
    authorize Page
    skip_policy_scope

    if bulk_update_params['ids'] && bulk_update_params['attrs']
      Page.where(:id => bulk_update_params['ids']).update_all(bulk_update_params['attrs'])
    end
    respond_to do |format|
      format.html do
        redirect_back fallback_location: admin_pages_path, notice: resource_bulk_update_success_message
      end
    end
  rescue => e
    respond_to do |format|
      format.html do
        redirect_back fallback_location: admin_pages_path, alert: e.message
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
    params
      .require(:page)
      .permit(:name, :is_main_nav,
              :is_commentable, :max_comments,
              :published, :root_page,
              :parent_id, :ordering,
               page_content_attributes: [
                 :id, :content, :excerpt,
                 :meta_description, :meta_css, :meta_js
               ]
      )
  end

  def bulk_update_params
    # ex: # {ids: ['174', '175'], 'attrs' => [:max_comments, :published]}
    params.fetch(:page, {}).permit({
       ids: [],
       attrs: [:max_comments, :parent_id, :published, :is_main_nav, :is_commentable]
     }).to_h
  end

end
