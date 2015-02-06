class Post < ActiveRecord::Base
	attr_accessor :author_id
  belongs_to :author, polymorphic: true
end
