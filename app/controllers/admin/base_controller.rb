class Admin::BaseController < ApplicationController
  before_filter :is_permitted?
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
  
  def is_permitted?
  	unless current_user && (current_user.is_admin || current_user.is_super_admin)
  		redirect_to '/'
  	end
  end
end
