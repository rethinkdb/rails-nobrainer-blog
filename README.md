This is the [Rails tutorial basic blog app](http://guides.rubyonrails.org/getting_started.html)
ported to use [NoBrainer](https://github.com/nviennot/nobrainer) ODM for
[RethinkDB](http://www.rethinkdb.com).

_Note_: this sample app is still under development.

## NoBrainer ODM for RethinkDB ##

In order to benefit of as much of the Rails-packaged goodies,
we're using [NoBrainer ODM for RethinkDB](https://github.com/nviennot/nobrainer).

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

## RethinkDB connection configuration ##

Instructing NoBrainer to connect to a specific RethinkDB databases is done
in the [nobrainer.rb](https://github.com/rethinkdb/rails-nobrainer-blog/blob/master/config/initializers/nobrainer.rb)
initializer, or with the RDB_URL environment variable.
The default connecton string is `rethinkdb://localhost/"#{rails_app_name}_#{Rails.env}"`.

## Accessing the data ##

You can check out the two controllers [posts_controller.rb](https://github.com/rethinkdb/rails-nobrainer-blog/blob/master/app/controllers/posts_controller.rb)
and [comments_controller.rb](https://github.com/rethinkdb/rails-nobrainer-blog/blob/master/app/controllers/comments_controller.rb)
to see how using the model methods translates
into RethinkDB's [ReQL queries](http://www.rethinkdb.com/api/#rb).
