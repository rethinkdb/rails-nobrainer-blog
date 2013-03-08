# class Post < ActiveRecord::Base
#   attr_accessible :content, :name, :title, :tags_attributes

#   validates :name, :presence =>true
#   validates :title, :presence => true,
#                     :length => { :minimum => 5 }

#   has_many :comments, :dependent => :destroy
#   has_many :tags

#   # `:allow_destroy`: enable destroing tags through the nested attributes
#   # `:reject_if`: prevent saving new tags that do not have any attributes filled in
#   accepts_nested_attributes_for :tags, :allow_destroy => :true,  
#                                        :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

# end
class Post
  include NoBrainer::Document

  field :content
  field :title
  field :author

  has_many :comments

  validates :author, :presence => true
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
end