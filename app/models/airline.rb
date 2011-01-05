class Airline < ActiveRecord::Base
  validates :flyFrom, :flyTo, :departureDaySection, :returnDaySection, :passengersToBoard, :presence => true
  validate :has_not_occurred
  #validate :number_of_passangers

  validates :departureOnThe, :returnOnThe, :format => {
    :with => /[2][0][1][1-2]-[0-9]{2}-[0-9]{2}/,
    :message => 'field did not validate. NOTE All itinerary dates must be a Valid Date between 2011 and 2012.' 
     }
     
  DAYPERIOD = ['Anytime', 'Morning', 'Afternoon', 'Evening', 'Late Night']  
      
  def validate
     errors.add_to_base "Your date(s) cannot be validated" if departureOnThe.blank? || returnOnThe.blank?
  end
  
  def is_in_the_past? 
   departureOnThe > returnOnThe  
  end
  
  def has_not_occurred 
    errors.add("return", "date should be on or after departure date.") if departureOnThe && returnOnThe && is_in_the_past?
  end
  
  def validate
     errors.add_to_base "That was tricky! Passangers must be an Integer between 1 and 10 inclusive" if number_of_passangers?
  end
  
  def number_of_passangers? 
   passengersToBoard < 1 || passengersToBoard > 10 || !passengersToBoard.is_a?(Fixnum)
  end
  def is_int_for_sure? 
     #passengersToBoard.is_a Integer == nil ? false : true
  end
  
  

    
  
  
  
  
end

