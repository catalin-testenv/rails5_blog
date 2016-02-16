class Admin::ArticlesController < Admin::AdminController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    authorize Article
    @resource_list = policy_scope(Article.all)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    authorize @resource
  end

  # GET /articles/new
  def new
    @resource = Article.new
    authorize @resource
  end

  # GET /articles/1/edit
  def edit
    authorize @resource
  end

  # POST /articles
  # POST /articles.json
  def create
    @resource = Article.new(resource_params)
    authorize @resource
    respond_to do |format|
      if @resource.save
        format.html { redirect_to admin_article_path(@resource),
                                  notice: resource_creation_success_message(resource_instance: @resource) }
      else
        format.html {
          flash.now[:alert] = resource_creation_failed_message(resource_instance: @resource)
          render :new
        }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    authorize @resource
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to admin_article_path(@resource), notice: resource_update_success_message(resource_instance: @resource) }
      else
        # @resource.errors[:base] << 'some error' << 'some other error'
        format.html {
          flash.now[:alert] = resource_update_failed_message(resource_instance: @resource)
          render :edit
        }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    authorize @resource
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to admin_articles_url, notice: resource_destroy_success_message(resource_instance: @resource) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:article).permit(:title)
    end
end
