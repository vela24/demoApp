class FightersController < ApplicationController
  before_action :set_fighter, only: %i[ show edit update destroy ]
  #If user is not signed in/authenticated - user ca only view index page and show page
  # This will also send them to the log in page
  before_action :authenticate_user!, except: [:index, :show]

  #Make sure user is the correct user for the below pages
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /fighters or /fighters.json
  def index
    @fighters = Fighter.all
  end

  # GET /fighters/1 or /fighters/1.json
  def show
  end

  # GET /fighters/new
  def new
   # @fighter = Fighter.new

   #Instead of placing created fighter into all of the fighters, 
   #place the new fighter into this userd fighter list.
   @fighter = current_user.fighters.build
  end

  # GET /fighters/1/edit
  def edit
  end

  # POST /fighters or /fighters.json
  def create
    #@fighter = Fighter.new(fighter_params)
    
    # create fighter under the curent users fighters - we may want to undo this
    # for the future so they we can display a list of all the fighters
    @fighter = current_user.fighters.build(fighter_params)


    respond_to do |format|
      if @fighter.save
        format.html { redirect_to @fighter, notice: "Fighter was successfully created." }
        format.json { render :show, status: :created, location: @fighter }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fighter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fighters/1 or /fighters/1.json
  def update
    respond_to do |format|
      if @fighter.update(fighter_params)
        format.html { redirect_to @fighter, notice: "Fighter was successfully updated." }
        format.json { render :show, status: :ok, location: @fighter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fighter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fighters/1 or /fighters/1.json
  def destroy
    @fighter.destroy
    respond_to do |format|
      format.html { redirect_to fighters_url, notice: "Fighter was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  #define who the correct user is here
  def correct_user
    #set correct user to the current users fighters
    @fighter = current_user.fighters.find_by(id: params[:id])
    # if user is not associated with the fighter - redirect the fighters page with error
    redirect_to fighters_path, notice: "Not authorized to edit this fighter" if @fighter.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fighter
      @fighter = Fighter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    #In order for form to submit all applicable paramteters must be set here
    def fighter_params
      params.require(:fighter).permit(:first_name, :last_name, :email, :phone, :bio, :user_id)
    end
end
