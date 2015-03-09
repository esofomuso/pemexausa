class WelcomeController < ApplicationController
	
	expose(:all_chapters) { Chapter.active }
	# @return [User]
	#   The user that is being created.
	expose(:new_user) { User.new(params[:user]) }
	expose(:user) { current_user }
	
	
  def index
  end

  def about_us
  end
  
  def membership
  end
  
  def chapters
  	Rails.logger.info ">>>>>>>>>>>>>>>> chapters = #{all_chapters.inspect}"
  end

  def donations
  end

  def projects
  end

  def contact_us
  end

  def terms_of_use
  end

  def privacy_policy
  end

  def help
  end
end
