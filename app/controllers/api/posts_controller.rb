class Api::PostsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    render json: Post.all
  end

  def show
    post = Post.find(params[:id])
    render json: post
  end

  def create
    post = Post.new(params_post)
    if post.save
      render json: {
        status: 200,
        message: "successfully created",
        post: post
      }.to_json

    else
      render status: 422, json: {
        errors: post.errors
      }.to_json
    end
  end

  def update
    post = Post.find(params[:id])
    post.update(params_post)
    if post.save
      render json: {
        status: 200,
        message: "successfully updated",
        post: post
      }.to_json
    else
      render status: 422, json: {
        message: "the post can't be updated",
        post: post
      }.to_json
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    render json: {
      status: 200,
      message: "successfully deleted"
    }.to_json
  end

  private

  def params_post
    params.require(:post).permit(:title, :body)
  end
end
