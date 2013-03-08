class CommentsController < ApplicationController
  def create
    logger.debug "CommentsController: #{params.inspect}"
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    if @comment.errors.any?
      render 'posts/show'
    else
      redirect_to post_path(@post)
    end
  end

  def destroy
    # Comment.find(params[:id]).destroy
    Comment.filter { |doc| doc[:id].eq(params[:id]) & doc[:post_id].eq(params[:post_id]) } 
    # Comment.where { |doc| doc[:id].eq(params[:id]) & doc[:post_id].eq(params[:post_id]) }.destroy
    # @post = Post.find(params[:post_id])
    # @comment = @post.comments.find(params[:id])
    # @comment.destroy
    redirect_to :controller => 'posts', :action => 'show', :id => params[:post_id] 
  end
end
