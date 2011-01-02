class OutsideViewerController < ApplicationController
  before_filter:authenticate_user!    # uncomment to lock intere site
  def show
    #need to make sure there is a valid page so do some checking here
    #with a simple if statement
    @page = Page.find_by_name(params[:name]) 
      
  end

end
