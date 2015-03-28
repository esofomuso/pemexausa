class WelcomeController < ApplicationController
		
	
  def index
  end

  def about_us
  end
  
  def membership
  end
  
  def chapters
  end

  def donations
  end

  def projects
  end

  def contact_us
  end

  def map
  	render text: "Map goes here", layout: 'application'
  end
  
  def gallery
  	render text: "Gallery goes here", layout: 'application'
  end
  
  def events
  	render text: "Events go here", layout: 'application'
  end
  
  def convention
  	render text: "Convention details go here", layout: 'application'
  end
  
  def terms_of_use
  end

  def privacy_policy
  end

  def help
  end
end
