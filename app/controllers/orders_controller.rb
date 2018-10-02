class OrdersController < ApiController
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /orders
  def index
    @orders = Order.all
    response = {status: :ok, result: @orders, errors: nil}
		render json: response
  end

  # GET /orders/1
  def show
    @order = Order.find(params[:id])
		response = {status: :ok, result: @order, errors: nil}
		render json: response
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      response = {status: :ok, result: 'Order created successfully', errors: nil}
			render json: response
    else
      response = { status: :FAIL, result: nil, errors: @order.errors }
      render json: response
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      response = { status: :OK, result: @order, errors: nil }
      render json: response
    else
      response = { status: :FAIL, result: nil, errors: @order.errors }
      render json: response
    end
  end

  # DELETE /orders/1
  def destroy
    if @order.destroy
      response = { status: :OK, result: 'Order has been deleted', errors: nil }
      render json: response
    else
      response = { status: :FAIL, result: nil, errors: @order.errors }
      render json: response
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.permit(:user_id, :total)
    end
end
