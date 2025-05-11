module Api
  module V1
    class PostsController < ApplicationController
      # Before actions to handle authentication (if needed)
      before_action :set_post, only: [:show, :update, :destroy]
      
      # GET /api/v1/posts
      def index
        @posts = Post.all
        render json: @posts
      end

      # GET /api/v1/posts/:id
      def show
        render json: @post
      end

      # POST /api/v1/posts
      def create
        @post = Post.new(post_params)

        if @post.save
          render json: @post, status: :created
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      # PUT /api/v1/posts/:id
      def update
        if @post.update(post_params)
          render json: @post
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/posts/:id
      def destroy
        @post.destroy
        head :no_content
      end

      private

      # Set post by ID for show, update, and destroy actions
      def set_post
        @post = Post.find(params[:id])
      end

      # Strong parameters to allow only permitted attributes
      def post_params
        params.require(:post).permit(:title, :content, :creator_id)  # Permits creator_id as part of post data
      end
    end
  end
end
