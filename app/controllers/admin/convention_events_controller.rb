class Admin::ConventionEventsController < Admin::BaseController
  expose(:convention_event) { ConventionEvent.find(params[:id]) || ConventionEvent.new }
  
  # POST /admin/convention_events
  # POST /admin/convention_events.json
  def create
    respond_to do |format|
      convention_event.attributes = convention_event_params
      if convention_event.save
        format.html { redirect_to admin_convention_events_path, notice: 'Convention event was successfully created.' }
        format.json { render :show, status: :created, location: convention_event }
      else
        format.html { render :new }
        format.json { render json: convention_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/convention_events/1
  # PATCH/PUT /admin/convention_events/1.json
  def update
    respond_to do |format|
      if convention_event.update(convention_event_params)
        format.html { redirect_to admin_convention_event_path(convention_event), notice: 'Convention event was successfully updated.' }
        format.json { render :show, status: :ok, location: convention_event }
      else
        format.html { render :edit }
        format.json { render json: convention_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/convention_events/1
  # DELETE /admin/convention_events/1.json
  def destroy
    convention_event.destroy
    respond_to do |format|
      format.html { redirect_to admin_convention_events_url, notice: 'Convention event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def convention_event_params
      params[:convention_event]
    end
end
