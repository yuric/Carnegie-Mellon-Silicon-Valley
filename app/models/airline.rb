class Airline < ActiveRecord::Base
  validates :flyFrom, :flyTo, :departureDaySection, :returnDaySection, :passengersToBoard, :presence => true
  validate :has_not_occurred
  #validate :number_of_passangers

  validates :departureOnThe, :returnOnThe, :format => {
    :with => /[2][0][1][1-2]-[0-9]{2}-[0-9]{2}/,
    :message => 'is not properly formated. NOTE All itinerary dates must be a Valid Date between 2011 and 2012.' 
     }
     
  DAYPERIOD = ['Anytime','Morning: [5a-12p]','Afternoon: [12p-5p]','Evening: [5p-9p]','Late Night: [9p-12a]' ]  
  #DAYPERIOD = [ ['Anytime', 0 ], ['Morning: [5 am - Noon]', 1], ['Afternoon: [Noon - 4 pm]', 2], ['Evening:   [4 pm - 7 pm]', 3], ['Late Night: [8 pm - 5 am]', 4]]  
  SAMEDAY = {'Anytime' => 0, 'Morning: [5a-12p]' => 1, 'Afternoon: [12p-5p]' => 2, 'Evening: [5p-9p]' => 3, 'Late Night: [9p-12a]' => 4}
  # puts pop['France'];   
  #def validate
   #  errors.add_to_base "Your date(s) cannot be validated" if departureOnThe.blank? || returnOnThe.blank?
  #end
  
  #def is_same_day_flight_with_ok_periods? 
   # departureOnThe == returnOnThe  
  #end
  
  
  # Validates departure and return date combination
  def is_in_the_past? 
   departureOnThe > returnOnThe 
  end
  
  def has_not_occurred# There are 2 types of errors for most fields so I highlight the field or the label depedantly
    errors.add("return", "date should be on or after Departure date.") if departureOnThe && returnOnThe && is_in_the_past?
    
    #makes sure the dates are not in the past
    if(departureOnThe && departureOnThe < Date.today)
      errors.add(:departureOnThe," is in the past") if returnOnThe
    end
    
    if (returnOnThe && returnOnThe < Date.today)
      errors.add(:returnOnThe, "is in the past") if departureOnThe 
    end
    

    
    #if (returnOnThe && departureOnThe && returnOnThe == departureOnThe && SAMEDAY[departureDaySection] == 0 || SAMEDAY[returnDaySection] == 0 )
    #  errors.add(:returnOnThe, "You're good") if departureOnThe 
    #end
    
    # Validates time block (ie, morning, night etc) so that if flight is in the same day return is before departure
    if (returnOnThe && departureOnThe && returnOnThe == departureOnThe && SAMEDAY[departureDaySection] != 0 && SAMEDAY[returnDaySection] != 0)
      
      if( SAMEDAY[returnDaySection] < SAMEDAY[departureDaySection] )
        errors.add(:returnOnThe, " time block incorrect. You can fly in the same day but you still need to Depart before you Return. ") if departureOnThe 
      
      end
      
    end
    # If return is morning but departure is anytime.
    if (returnOnThe && departureOnThe && returnOnThe == departureOnThe && SAMEDAY[departureDaySection] == 0 && SAMEDAY[returnDaySection] == 1)
      
        errors.add(:departureOnThe, " time block incorrect. If you want to return in the morning of the same day you MUST depart in the morning. ") if departureOnThe 
            
    end
    
    
  end
  
  # Validate number of passangers
  def validate
     errors.add_to_base "That was tricky! Passangers must be an integer between 1 and 10 inclusive.\nYou tried:"+passengersToBoard.to_s if number_of_passangers?
     #errors.add("passengers", "tried:"+passengersToBoard.to_s) if number_of_passangers? 
  end
  
  def number_of_passangers? 
   passengersToBoard < 1 || passengersToBoard > 10 || !passengersToBoard.is_a?(Fixnum)
  end
  
 

    
  
  
  
  
end

