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
    session[admin_pages_path] = request.original_fullpath
    authorize Page
    @resource_list = list_ops_sort(policy_scope(apply_scopes(Page))).page(params[:page]).per(Setting.listing_items_per_page)
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
          redirect_to listing_path, notice: resource_creation_success_message(resource_instance: @resource)
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
      p resource_params
      if @resource.update(resource_params)
        format.html do
          redirect_to listing_path, notice: resource_update_success_message(resource_instance: @resource)
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

  # POST /admin/pages/bulk_update
  def bulk_update
    authorize Page
    skip_policy_scope

    if bulk_params['ids'] && bulk_params['attrs']
      Page.where(:id => bulk_params['ids']).update_all(bulk_params['attrs'])
    end
    respond_to do |format|
      format.html do
        redirect_to listing_path, notice: resource_bulk_update_success_message
      end
    end
  rescue => e
    respond_to do |format|
      format.html do
        redirect_to listing_path, alert: e.message
      end
    end
  end

  # DELETE /admin/pages/1
  def destroy
    authorize @resource
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to listing_path, notice: resource_destroy_success_message(resource_instance: @resource) }
    end
  end

  # DELETE /admin/pages/bulk_delete
  def bulk_destroy
    authorize Page
    skip_policy_scope

    if bulk_params['ids']
      Page.where(:id => bulk_params['ids']).destroy_all
    end
    respond_to do |format|
      format.html do
        redirect_to listing_path, notice: resource_bulk_destroy_success_message
      end
    end
  rescue => e
    respond_to do |format|
      format.html do
        redirect_to listing_path, alert: e.message
      end
    end
  end

  private

  def listing_path
    session[admin_pages_path] || admin_pages_path
  end

  def set_resource
    @resource = Page.find(params[:id])
  end

  def resource_params
    params
      .require(:page)
      .permit(:name, :is_main_nav,
              :is_commentable,
              :published, :root_page,
              :parent_id, :ordering, tags: Tag.ids.map(&:to_s),
               page_content_attributes: [
                 :id, :content, :excerpt,
                 :meta_description, :meta_css, :meta_js
               ]
      ).tap{ |_params| _params['tags'] &&= Tag.find(_params['tags'].keys) }
  end

  def bulk_params
    # ex: # {ids: ['174', '175'], 'attrs' => [:is_main_nav, :published]}
    params.fetch(:page, {}).permit({
       ids: [],
       attrs: [:parent_id, :published, :is_main_nav, :is_commentable]
     }).to_h
  end

end
