class Comment
  include NoBrainer::Document

  # Defines the fields of the document visible to the application
  field :body
  field :commenter

  # Defines a many-to-one relationship between +Comments+ and +Post+s.
  belongs_to :post

  # Rails validations
  validates :body, :presence => true
  validates :commenter, :presence => true
end