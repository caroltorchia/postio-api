module Api
  module V1
    class CommentsController < ApplicationController
      before_action :set_post, only: %i[show create update destroy]
      before_action :set_comment, only: %i[show update destroy]

      # GET /comments
      # GET /comments.json
      def index
        @comments = Comment.all
      end

      # GET /comments/1
      # GET /comments/1.json
      def show
      end

      # POST /comments
      # POST /comments.json
      def create
        @comment = @post.comments.build(comment_params.merge(user_id: @post.user_id))

        if @comment.save
          render :show, status: :created, location: api_v1_post_comment_url(@post, @comment)
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /comments/1
      # PATCH/PUT /comments/1.json
      def update
        if @comment.update(comment_params)
          render :show, status: :ok, location: api_v1_post_comment_url(@post, @comment)
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      # DELETE /comments/1
      # DELETE /comments/1.json
      def destroy
        @comment.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.

        def set_post
          @post = current_user.posts.find(params[:post_id])
        end

        def set_comment
          @comment = @post.comments.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def comment_params
          params.require(:comment).permit(:content, :post_id, :user_id)
        end
    end
  end
end
