class FruitsController < ApiController
  before_action :set_fruit, only: [:update, :destroy]
  skip_before_action :authorize_request, only: [:show, :index]

  # GET /fruits
  def index
    # @fruits = Fruit.all
    @fruits = Fruit.where("stock > ?", 0) 
    response = { status: :OK, result: @fruits, errors: nil }
    render json: response
  end

  # GET /fruits/1
  def show
    @fruits = Fruit.find(params[:id])
      response = { status: :OK, result: @musicians, errors: nil }
      render json: response
  end

  # POST /fruits
  def create
    @fruit = Fruit.new(fruit_params)

    if @fruit.save
      response = { status: :OK, result: 'Fruit created successfully', errors: nil }
      render json: response
    else
      response = { status: :FAIL, result: nil, errors: @fruit.errors }
      render action: 'new', json: response
    end
  end

  # PATCH/PUT /fruits/1
  def update
    if @fruit.update(fruit_params)
      response = { status: :OK, result: @fruit, errors: nil }
      render json: response
    else
      response = { status: :FAIL, result: nil, errors: @fruit.errors }
      render json: response
    end
  end

  # DELETE /fruits/1
  def destroy
    if @fruit.destroy
      response = { status: :OK, result: 'Fruit has been deleted', errors: nil }
      render json: response
    else
      response = { status: :FAIL, result: nil, errors: @fruit.errors }
      render json: response
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fruit
      @fruit = Fruit.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fruit_params
      params.require(:fruit).permit(:name, :price, :stock, :avatar)
    end
end
