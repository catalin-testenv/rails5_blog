class Admin::CommentsController < Admin::AdminController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  include HasScopeCreatedAtConcern

  # GET /admin/comments
  def index
    session[admin_comments_path] = request.original_fullpath
    authorize Comment
    @resource_list = list_ops_sort(policy_scope(apply_scopes(Comment))).page(params[:page]).per(Setting.listing_items_per_page)
  end

  # GET /admin/comments/1
  def show
    authorize @resource
    render :edit
  end

  # GET /admin/comments/new
  def new
    @resource = Comment.new()
    authorize @resource
  end

  # GET /admin/comments/1/edit
  def edit
    authorize @resource
  end

  # POST /admin/comments
  def create
    @resource = Comment.new(resource_params)
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

  # PATCH/PUT /admin/comments/1
  def update
    authorize @resource
    respond_to do |format|
      if @resource.update(resource_params)
        format.html do
          redirect_to listing_path, notice: resource_update_success_message(resource_instance: @resource)
        end
      else
        format.html do
          flash.now[:alert] = resource_update_failed_message(resource_instance: @resource)
          render :edit
        end
      end
    end
  end

  # POST /admin/comments/bulk_update
  def bulk_update
    authorize Comment
    skip_policy_scope

    if bulk_params['ids'] && bulk_params['attrs']
      Comment.where(:id => bulk_params['ids']).update_all(bulk_params['attrs'])
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

  # DELETE /admin/comments/1
  def destroy
    authorize @resource
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to listing_path, notice: resource_destroy_success_message(resource_instance: @resource) }
    end
  end

  # DELETE /admin/comments/bulk_delete
  def bulk_destroy
    authorize Comment
    skip_policy_scope

    if bulk_params['ids']
      Comment.where(:id => bulk_params['ids']).destroy_all
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
    session[admin_comments_path] || admin_comments_path
  end

  def set_resource
    @resource = Comment.find(params[:id])
  end

  def resource_params
    params
      .require(:comment)
      .permit(:content, :status, :page_id, :user_id)
  end

  def bulk_params
    # ex: # {ids: ['174', '175'], 'attrs' => [:status]}
    params.fetch(:comment, {}).permit({
       ids: [],
       attrs: [:status]
     }).to_h
  end

end
