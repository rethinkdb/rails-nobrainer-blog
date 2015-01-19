class Comment
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  # Defines the fields of the document visible to the application
  field :commenter, :type => String, :required => true
  field :body,      :type => Text,   :min_length => 5

  # Defines a many-to-one relationship between +Comments+ and +Post+s.
  belongs_to :post, :required => true
end
