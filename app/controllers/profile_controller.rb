class ProfileController < ApplicationController
	
	# @return [User]
	#   The user that is being created.
	expose(:new_user) { User.new(params[:user]) }
	
	
  def new
  end
end
