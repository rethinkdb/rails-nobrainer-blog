class CommentsController < ApplicationController
  # Create a new +Comment+ belonging to the +Post+
  # specified by +params[:post_id]+.
  #
  # The +Post.find+ is equivalent to a ReQL
  # [get](http://www.rethinkdb.com/api/#rb:selecting_data-get) query
  # which retrieves a row by its id using the primary key index.
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])

    if @comment.errors.any?
      render 'posts/show'
    else
      redirect_to post_path(@post)
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
    redirect_to :controller => 'posts', :action => 'show', :id => params[:post_id]
  end
end
