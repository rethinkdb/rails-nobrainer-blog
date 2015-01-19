class CommentsController < ApplicationController
  # Create a new +Comment+ belonging to the +Post+
  # specified by +params[:post_id]+.
  #
  # The +Post.find+ is equivalent to a ReQL
  # [get](http://www.rethinkdb.com/api/#rb:selecting_data-get) query
  # which retrieves a row by its id using the primary key index.
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params.merge(:post => @post))

    respond_to do |format|
      if @comment.save?
        format.html { redirect_to :controller => 'posts', :action => 'show', :id => params[:post_id] }
        format.json { render json: @comment, status: :created }
      else
        format.html { render 'posts/show' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a +Comment+. In ReQL this involves the following chain
  # of operations: [get](http://www.rethinkdb.com/api/#rb:selecting_data-get)
  # followed by [delete]()http://www.rethinkdb.com/api/#rb:writing_data-delete).
  #
  # _Note_: the +get+ and +delete+ operations are both executed on the database
  # and they do not require 2 round trips.
  def destroy
    Comment.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to :controller => 'posts', :action => 'show', :id => params[:post_id] }
      format.json { head :no_content }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commenter)
  end
end
