class StatusesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_status, only: [:show, :edit, :update, :destroy]
  before_action :correct_user,   only: [:destroy, :edit]

  # GET /statuses
  # GET /statuses.json
  def index
    #@statuses = Status.all
    #@statuses = Status.where(:private => false).or(:user_id => current_user).paginate(page: params[:page], per_page: 50).order('created_at DESC')
    @statuses = Status.where('private=? OR user_id=?', false, current_user).paginate(page: params[:page], per_page: 50).order('created_at DESC')
  end

  # GET /statuses/1
  # GET /statuses/1.json
  def show

    if can? :read, @status
      render action: :show
    else
      render file: 'public/pleaseregister'
    end
  end

  # GET /statuses/new
  def new
    @status = Status.new
  end

  # GET /statuses/1/edit
  def edit
  end

  # POST /statuses
  # POST /statuses.json
  def create

    @user = current_user
    @status = @user.statuses.build(status_params)

    #@status = Status.new(status_params)

    respond_to do |format|
      if @status.save
        format.html { redirect_to @status, notice: 'Status was successfully created.' }
        format.json { render :show, status: :created, location: @status }
      else
        format.html { render :new }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statuses/1
  # PATCH/PUT /statuses/1.json
  def update
    if can? :update, @status
    respond_to do |format|

        if @status.update(status_params)

          format.html { redirect_to @status, notice: 'Status was successfully updated.' }
          format.json { render :show, status: :ok, location: @status }
        else
          format.html { render :edit }
          format.json { render json: @status.errors, status: :unprocessable_entity }
        end

    end
    end
  end

  # DELETE /statuses/1
  # DELETE /statuses/1.json
  def destroy
    if can? :delete, @status
      @status.destroy
      respond_to do |format|

          format.html { redirect_to statuses_url, notice: 'Status was successfully destroyed.' }
          format.json { head :no_content }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status
      @status = Status.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_params
      params.require(:status).permit(:name, :content, :user_id, :private)
    end

    def correct_user
      @status = current_user.statuses.find_by(id: params[:id])
      redirect_to root_url if @status.nil?
    end
end
