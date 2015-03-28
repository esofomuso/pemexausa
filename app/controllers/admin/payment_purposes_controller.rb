class Admin::PaymentPurposesController < Admin::BaseController
  expose(:payment_purpose) {PaymentPurpose.find_by_id(params[:id]) || PaymentPurpose.new}
  

  # POST /admin/payment_purposes
  # POST /admin/payment_purposes.json
  def create
    payment_purpose.attributes = payment_purpose_params

    respond_to do |format|
      if payment_purpose.save
        format.html { redirect_to admin_payment_purposes_path, notice: 'Payment purpose was successfully created.' }
        format.json { render :show, status: :created, location: payment_purpose }
      else
        format.html { render :new }
        format.json { render json: payment_purpose.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/payment_purposes/1
  # PATCH/PUT /admin/payment_purposes/1.json
  def update
    respond_to do |format|
      if payment_purpose.update(payment_purpose_params)
        format.html { redirect_to payment_purpose, notice: 'Payment purpose was successfully updated.' }
        format.json { render :show, status: :ok, location: payment_purpose }
      else
        format.html { render :edit }
        format.json { render json: payment_purpose.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/payment_purposes/1
  # DELETE /admin/payment_purposes/1.json
  def destroy
    payment_purpose.destroy
    respond_to do |format|
      format.html { redirect_to admin_payment_purposes_url, notice: 'Payment purpose was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
   # Never trust parameters from the scary internet, only allow the white list through.
    def payment_purpose_params
      params[:payment_purpose]
    end
end
