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