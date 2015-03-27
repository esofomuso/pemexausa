class Admin::BaseController < ApplicationController
   before_filter :is_permitted?
  check_authorization :if => :admin_subdomain?
  #load_and_authorize_resource
  
  layout 'admin'
  
  expose(:all_chapters) { Chapter.active }
  expose(:convention_events) { ConventionEvent.all }
  expose(:countries) { Country.all }
  expose(:members) { Member.all }
  expose(:payment_purposes) { PaymentPurpose.all }
  expose(:payments) { Payment.all }
  expose(:photos) { Photo.all }
  expose(:projects) { Project.all }
  expose(:states) { State.all }
  expose(:users) { User.all }
  expose(:zips) { Zip.all }
  expose(:cities) { City.all }
  
   def is_permitted?
   	if can? :read, :admin #current_user && (current_user.admin? || current_user.super_admin?)
	   	authorize! :read, :admin
	  else 
	  	raise CanCan::AccessDenied
	  end
   end
  
  def index
  end
  
  private
  def admin_subdomain?
    request.path == "/admin"
  end
end
