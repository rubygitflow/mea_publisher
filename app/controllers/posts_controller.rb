# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show; end

  # GET /posts/new
  def new
    @post = Post.new(person_id: current_user.id)
    @post.current_user = current_user
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.current_user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post from #{@post.author_name} was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post from #{@post.author_name} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
    @post.current_user = current_user
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :person_id, :body)
  end
end
