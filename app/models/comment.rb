class Comment < ActiveRecord::Base
  validates :your_name, :your_comment, :presence => true
  attr_accessible  :your_name, :your_comment
  
end
