

class Airline < ActiveRecord::Base
  validates :flyFrom, :flyTo, :departureDaySection, :returnDaySection, :passengersToBoard, :presence => true
  validate :has_not_occurred
    
  validates :departureOnThe, :returnOnThe, :format => {
    :with => /[2][0][1][1-2]-[0-9]{2}-[0-9]{2}/,
    :message => 'field did not validate. NOTE All itinerary dates must a Valid Date between 2011 and 2012.' 
     }
  DAYPERIOD = ['Anytime', 'Morning', 'Afternoon', 'Evening', 'Late Night']
      
  def validate
     errors.add_to_base "Your date cannot be validated" if departureOnThe.blank? || returnOnThe.blank?
  end
  
  
  
  def is_in_the_past? 
   departureOnThe >= returnOnThe  
  end
  
  def has_not_occurred 
    errors.add("return", "date should be on or after departure date.") if departureOnThe && returnOnThe && is_in_the_past?
  end
  

    
  
  
  
  
end

