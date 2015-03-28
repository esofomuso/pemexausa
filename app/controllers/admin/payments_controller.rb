class Admin::PaymentsController < Admin::BaseController
  expose(:payment) {Payment.find_by_id(params[:id]) || Payment.new}
  
  # POST /admin/payments
  # POST /admin/payments.json
  def create
    payment.attributes = payment_params

    respond_to do |format|
      if payment.save
        format.html { redirect_to admin_payments_path, notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: payment }
      else
        format.html { render :new }
        format.json { render json: payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/payments/1
  # PATCH/PUT /admin/payments/1.json
  def update
    respond_to do |format|
      if payment.update(admin_payment_params)
        format.html { redirect_to admin_payment_path(payment), notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: payment }
      else
        format.html { render :edit }
        format.json { render json: payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/payments/1
  # DELETE /admin/payments/1.json
  def destroy
    payment.destroy
    respond_to do |format|
      format.html { redirect_to admin_payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params[:payment]
    end
end
