module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: %i[show update destroy]

      # GET /posts
      # GET /posts.json
      def index
        @posts = Post.all
      end

      # GET /posts/1
      # GET /posts/1.json
      def show
      end

      # POST /posts
      # POST /posts.json
      def create
        @post = current_user.posts.build(post_params)

        if @post.save
          render :show, status: :created, location: api_v1_post_url(@post)
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /posts/1
      # PATCH/PUT /posts/1.json
      def update
        if @post.update(post_params)
          render :show, status: :ok, location: api_v1_post_url(@post)
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      # DELETE /posts/1
      # DELETE /posts/1.json
      def destroy
        @post.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_post
          @post = current_user.posts.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def post_params
          params.require(:post).permit(:title, :content, :user_id)
        end
    end
  end
end
