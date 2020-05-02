class IslandersController < ApplicationController
  before_action :set_islander, only: [:show, :edit, :update, :destroy]

  # GET /islanders
  # GET /islanders.json
  def index
    @islanders = Islander.all
  end

  # GET /islanders/1
  # GET /islanders/1.json
  def show
  end

  # GET /islanders/new
  def new
    @islander = Islander.new
  end

  # GET /islanders/1/edit
  def edit
  end

  # POST /islanders
  # POST /islanders.json
  def create
    @islander = Islander.new(islander_params)

    respond_to do |format|
      if @islander.save
        format.html { redirect_to @islander, notice: 'Islander was successfully created.' }
        format.json { render :show, status: :created, location: @islander }
      else
        format.html { render :new }
        format.json { render json: @islander.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /islanders/1
  # PATCH/PUT /islanders/1.json
  def update
    respond_to do |format|
      if @islander.update(islander_params)
        format.html { redirect_to @islander, notice: 'Islander was successfully updated.' }
        format.json { render :show, status: :ok, location: @islander }
      else
        format.html { render :edit }
        format.json { render json: @islander.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /islanders/1
  # DELETE /islanders/1.json
  def destroy
    @islander.destroy
    respond_to do |format|
      format.html { redirect_to islanders_url, notice: 'Islander was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_islander
      @islander = Islander.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def islander_params
      params.require(:islander).permit(:email, :timezzone)
    end
end
