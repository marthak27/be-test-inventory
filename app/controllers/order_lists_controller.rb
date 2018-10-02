class OrderListsController < ApiController
  before_action :set_order_list, only: [:show, :update, :destroy]

  # GET /order_lists
  def index
    @order_lists = OrderList.all
    response = {status: :ok, result: @order_lists, errors: nil}
		render json: response
  end

  # GET /order_lists/1
  def show
    @order_lists = OrderList.find(params[:id])
		response = {status: :ok, result: @order_lists, errors: nil}
		render json: response
  end

  # POST /order_lists
  def create
    @order_list = OrderList.new(order_list_params)

    if @order_list.save
      response = {status: :ok, result: @order_list, errors: nil}
			render json: response
    else
      response = {status: :FAIL, result: nil, errors: @order_list.errors}
			render json: response
    end
  end

  # PATCH/PUT /order_lists/1
  def update
    if @order_list.update(order_list_params)
      response = {status: :ok, result: @order_list, errors: nil}
			render json: response
    else
      response = {status: :FAIL, result: nil, errors: @order_list.errors}
			render json: response
    end
  end

  # DELETE /order_lists/1
  def destroy
    if @order_list.destroy
			response = {status: :ok, result: @order_list, errors: nill}
			render json: response
		else
			response = {status: :FAIL, result: nil, errors: @order_list.errors}
			render json: response
		end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_list
      @order_list = OrderList.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_list_params
      params.permit(:order_id, :fruit_id, :qty, :price)
    end
end
