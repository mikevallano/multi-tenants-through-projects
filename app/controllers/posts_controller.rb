class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # before_action :scoped_to_project?, only: [:show, :edit, :update, :destroy] #ensures the current user has access to the post
  before_action :can_access_project? #this is another check that the user can access the current project
  # after_action :verify_authorized #verifies each action through the corresponding pundit policy
  before_action :authenticate_user! #devise check to ensure only logged in users can access

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    # authorize @posts
    puts "current project is: #{@current_project.name}"
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    if request.path != project_post_path(@current_project, @post)
      return redirect_to project_post_path(@current_project, @post), :status => :moved_permanently
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
    # authorize @post
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    # authorize @post
    respond_to do |format|
      if @post.save
        format.html { redirect_to project_posts_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to project_posts_path, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to project_posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
      # authorize @post
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :description, :project_id)
    end

    # def scoped_to_project?
    #   @permitted_account = current_user.account #identify a place to redirect user to
    #   if @post.project_id != @current_project.id
    #     redirect_to account_path(@permitted_account), notice: 'That post is not part of this project.'
    #   end
    # end
end
