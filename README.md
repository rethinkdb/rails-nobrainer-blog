This is the [Rails tutorial basic blog app](http://guides.rubyonrails.org/getting_started.html)
ported to use [NoBrainer](http://nobrainer.io/) ORM for [RethinkDB](http://www.rethinkdb.com).

_Note_: this sample app is still under development.

## NoBrainer ORM for RethinkDB ##

In order to benefit of as much of the Rails-packaged goodies,
we're using the [NoBrainer ORM for RethinkDB](http://nobrainer.io/).

Using NoBrainer instead of ActiveRecord is very easy:

```ruby
class Post
  include NoBrainer::Document

  # Defines the fields of the document visible to the application
  field :title
  field :content
  field :author

  # Define a one-to-many relationship between +Post+ and +Comment+
  has_many :comments

  # Rails validations
  validates :author, :presence => true
  validates :title, :presence => true,
            :length => {:minimum => 5}
end
```

See the two models defined by this sample app for more details:
[post.rb](https://github.com/rethinkdb/rails-nobrainer-blog/blob/master/app/models/post.rb)
and [comment.rb](https://github.com/rethinkdb/rails-nobrainer-blog/blob/master/app/models/comment.rb)

## Accessing the data ##

You can check out the two controllers [posts_controller.rb](https://github.com/rethinkdb/rails-nobrainer-blog/blob/master/app/controllers/posts_controller.rb)
and [comments_controller.rb](https://github.com/rethinkdb/rails-nobrainer-blog/blob/master/app/controllers/comments_controller.rb)
to see how using the model methods translates
into RethinkDB's [ReQL queries](http://www.rethinkdb.com/api/#rb).

## Try it on Heroku

NoBrainer detects the RethinkDB Cloud environement on Heroku out of the box and
connects to the proper database automatically.
Follow the steps to deploy the blog example application on Heroku:

```
$ git clone https://github.com/rethinkdb/rails-nobrainer-blog.git
$ cd rails-nobrainer-blog
$ heroku create
$ heroku addons:add rethinkdb-cloud
$ git push heroku
```

Once done, you should be able to interact with your deployed application.
