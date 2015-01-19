class Post
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  # Defines the fields of the document visible to the application
  field :author,  :type => String, :required => true
  field :title,   :type => String, :required => true
  field :content, :type => Text,   :min_length => 5

  # Defines a one-to-many relationship between +Post+ and +Comment+
  has_many :comments, :dependent => :destroy
end
