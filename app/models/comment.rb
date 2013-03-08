# class Comment < ActiveRecord::Base
#   belongs_to :post
#   attr_accessible :body, :commenter
# end

class Comment
    include NoBrainer::Document

    field :body
    field :commenter

    belongs_to :post

    validates :body, :presence => true
    validates :commenter, :presence => true
end