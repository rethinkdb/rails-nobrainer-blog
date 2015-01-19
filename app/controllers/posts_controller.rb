class PostsController < ApplicationController

  # Responding to `GET` requests to `/posts` and `/posts.json`
  # by retrieving `all` `Post`s.
  #
  # `Posts.all` translates to a [table](http://www.rethinkdb.com/api/#rb:selecting_data-table)
  # query which returns a batched enumerable.
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # Retrieves a single post by id using +Post.find+. This function
  # translates to a [get](http://www.rethinkdb.com/api/#rb:selecting_data-get) query
  # which retrieves a specific document by its id using the primary index.
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # Edit a single +Post+ specified by +:id+ as results of +GET+ /posts/1/edit.
  # The +Post.find+ results in a ReQL [get](http://www.rethinkdb.com/api/#rb:selecting_data-get) query.
  def edit
    @post = Post.find(params[:id])
  end

  # Create a new +Post+ as result of a +POST+ request to /posts or /posts.json.
  #
  # The +@post.save+ results in a ReQL [insert](http://www.rethinkdb.com/api/#rb:writing_data-insert)
  # operation. NoBrainer receives the result and extracts the new document +id+ and sets it
  # on the +@post+ instance.
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save?
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update?(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a +Post+ as result of a +DELETE+ request.
  #
  # In ReQL this involves the following chain
  # of operations: [get](http://www.rethinkdb.com/api/#rb:selecting_data-get)
  # followed by [delete]()http://www.rethinkdb.com/api/#rb:writing_data-delete).
  #
  # _Note_: the +get+ and +delete+ operations are both executed on the database
  # and they do not require 2 round trips.
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :author)
  end
end
