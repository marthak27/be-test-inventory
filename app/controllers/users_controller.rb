class UsersController < ApiController
  # before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :authorize_request, only: :create
  # GET /users
  def index
    @users = User.all
    response = { status: :OK, result: @users, errors: nil }
    render json: response
  end

  # GET /users/1
  def show
    @users = User.find(params[:id])
        response = { status: :OK, result: @users, errors: nil }
        render json: response
    #render json: @user
  end

  # POST /users
  def create
    user = User.create(user_params)
    # @user = User.new(user_params)

    if user.save
      response = { status: :OK, result: Message.account_created, errors: nil }
      render json: response
    else
        response = { status: :FAIL, result: nil, errors: user.errors }
        render json: response
    end
  end

  # PATCH/PUT /users/1
  def update
    @user = User.find(params[:id])
        if @user.update(user_params)
            #render json: { message: 'User has been update.' }
            response = { status: :OK, result: @user, errors: nil }
            render json: response
        else
            response = { status: :FAIL, result: nil, errors: @user.errors }
            render json: response
        end
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
        response = { status: :OK, result: 'User has been deleted', errors: nil }
        render json: response
      else
        response = { status: :FAIL, result: nil, errors: @user.errors }
        render json: response
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:name, :address, :tlp, :email, :password)
    end
end
