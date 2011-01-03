class Comment < ActiveRecord::Base
  validates :your_name, :your_comment, :presence => true
end
