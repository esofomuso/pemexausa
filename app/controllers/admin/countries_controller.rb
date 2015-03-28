class Admin::CountriesController < Admin::BaseController
  
  expose(:country) { Country.find_by_id(params[:id]) || Country.new }

  # POST /admin/countries
  # POST /admin/countries.json
  def create
    country.attributes = country_params

    respond_to do |format|
      if country.save
        format.html { redirect_to admin_countries_path, notice: 'Country was successfully created.' }
        format.json { render :show, status: :created, location: country }
      else
        format.html { render :new }
        format.json { render json: country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/countries/1
  # PATCH/PUT /admin/countries/1.json
  def update
    respond_to do |format|
      if country.update(country_params)
        format.html { redirect_to admin_country_path(country), notice: 'Country was successfully updated.' }
        format.json { render :show, status: :ok, location: country }
      else
        format.html { render :edit }
        format.json { render json: country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/countries/1
  # DELETE /admin/countries/1.json
  def destroy
    country.destroy
    respond_to do |format|
      format.html { redirect_to admin_countries_path, notice: 'Country was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def country_params
      params.require(:country).permit(:name, :code2, :code3)
      
    end
end
