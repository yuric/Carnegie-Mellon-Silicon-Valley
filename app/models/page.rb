class Page < ActiveRecord::Base
  Sample = ['Anytime', 'Morning', 'Afternoon', 'Evening', 'Late Night']
  validates :content, :presence => true
  attr_accessible :content
  
  
  
end
