class CharactersController < ApplicationController
  before_filter :auth_user!

  # GET /characters
  # GET /characters.json
  def index
    @characters = Character.where(:user_id => current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @characters }
    end
  end

  #GET /characters/1/use
  def use
    @character = Character.where(:user_id => current_user.id).find(params[:id])

    session[:current_character_id] = @character.id
  end
   
  #GET /characters/current
  #GET /characters/current.json
  def current
    @character = Character.where(:user_id => current_user.id).find(session[:current_character_id])
      
    respond_to do |format|
      format.html # current.html.erb
      format.json { render json: @character }
    end
  end
   
  
  # GET /characters/1
  # GET /characters/1.json
  def show
    @character = Character.where(:user_id => current_user.id).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @character }
    end
  end

  # GET /characters/new
  # GET /characters/new.json
  def new
    @character = Character.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @character }
    end
  end

  # GET /characters/1/edit
  def edit
    @character = Character.where(:user_id => current_user.id).find(params[:id])
  end

  # POST /characters
  # POST /characters.json
  def create
    @character = Character.new(params[:character])
    @character.user = current_user
    @character.char_experience = 0
    @character.position = Position.new
    @character.position.pos_direction = 'None'
    @character.position.pos_x = 0
    @character.position.pos_y = 0
    @character.position.pos_changed_date = Time.now
 
    
    respond_to do |format|
      if @character.save
        format.html { redirect_to @character, notice: 'Character was successfully created.' }
        format.json { render json: @character, status: :created, location: @character }
      else
        format.html { render action: "new" }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /characters/1
  # PUT /characters/1.json
  def update
    @character = Character.where(:user_id => current_user.id).find(params[:id])

    respond_to do |format|
      if @character.update_attributes(params[:character])
        format.html { redirect_to @character, notice: 'Character was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character = Character.where(:user_id => current_user.id).find(params[:id])
    @character.destroy

    respond_to do |format|
      format.html { redirect_to characters_url }
      format.json { head :ok }
    end
  end
  
  
end
