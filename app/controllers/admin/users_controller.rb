class Admin::UsersController < Admin::AdminController

  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  include HasScopeCreatedAtConcern

  # GET /admin/users
  def index
    session[admin_users_path] = request.original_fullpath
    authorize User
    @resource_list = list_ops_sort(policy_scope(apply_scopes(User))).page(params[:page]).per(Setting.listing_items_per_page)
  end

  # GET /admin/users/1
  def show
    authorize @resource
    render :edit
  end

  # GET /admin/users/new
  def new
    @resource = User.new()
    authorize @resource
  end

  # GET /admin/users/1/edit
  def edit
    authorize @resource
  end

  # POST /admin/users
  def create
    @resource = User.new(resource_params)
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

  # PATCH/PUT /admin/users/1
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

  # DELETE /admin/users/1
  def destroy
    authorize @resource
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to listing_path, notice: resource_destroy_success_message(resource_instance: @resource) }
    end
  end

  private

  def listing_path
    session[admin_users_path] || admin_users_path
  end

  def set_resource
    @resource = User.find(params[:id])
  end

  def resource_params
    params
        .require(:user)
        .permit(:name, :image)
  end

  # overrides ListOpsConcern
  def list_ops_sortable_columns
    User.column_names << 'comments_count'
  end

end
