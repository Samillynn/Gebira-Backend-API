class DeceasedPostsController < ApplicationController
  before_action :set_deceased_post, only: %i[ show update destroy ]

  # GET /deceased_posts
  def index
    _start = params[:start] || 1
    _end = params[:end] || _start + 19

    @deceased_posts = DeceasedPost.where(id: _start.._end)

    render json: @deceased_posts
  end

  # GET /deceased_posts/1
  def show
    render json: @deceased_post
  end

  # POST /deceased_posts
  def create
    @deceased_post = DeceasedPost.new(deceased_post_params)

    if @deceased_post.save
      render json: @deceased_post, status: :created, location: @deceased_post
    else
      render json: @deceased_post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /deceased_posts/1
  def update
    if @deceased_post.update(deceased_post_params)
      render json: @deceased_post
    else
      render json: @deceased_post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /deceased_posts/1
  def destroy
    @deceased_post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deceased_post
      @deceased_post = DeceasedPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deceased_post_params
      params.require(:deceased_post).permit(:user_id, :name, :gender, :age, :date_of_birth, :date_found, :location, :vague_location, :hair_length, :hair_color, :skin_color, :description)
    end
end
