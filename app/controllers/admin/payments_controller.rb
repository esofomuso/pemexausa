class Admin::PaymentsController < Admin::BaseController
  before_action :set_admin_payment, only: [:show, :edit, :update, :destroy]

  # GET /admin/payments
  # GET /admin/payments.json
  def index
    payments = Payment.all
  end

  # GET /admin/payments/1
  # GET /admin/payments/1.json
  def show
  end

  # GET /admin/payments/new
  def new
    payment = Payment.new
  end

  # GET /admin/payments/1/edit
  def edit
  end

  # POST /admin/payments
  # POST /admin/payments.json
  def create
    payment = Payment.new(admin_payment_params)

    respond_to do |format|
      if payment.save
        format.html { redirect_to payment, notice: 'Payment was successfully created.' }
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
        format.html { redirect_to payment, notice: 'Payment was successfully updated.' }
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
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_payment
      payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_payment_params
      params[:admin_payment]
    end
end
