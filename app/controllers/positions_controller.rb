class PositionsController < ApplicationController
  before_filter :auth_user!

  # GET /positions.json
  def index
    @position= Position.all

    respond_to do |format|
      format.json { render json: @position }
    end
  end

  # GET /positions/current.json
  def current
    #@position = Character.find(5).position
#
 #   respond_to do |format|
  #    format.json { render json: @position }
  #  end
 
  
     respond_to do |format|
      format.json { render json: "{id:1}" }
    end
  #render json :@wtf
  end

  # PUT /characters/1.json
  def update
    @position = Character.find(session[:current_character_id]).position

    respond_to do |format|
      if @position.update_attributes(params[:position])
        format.json { head :ok }
      else
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

end

 def auth_user!
  if current_user.nil?
    redirect_to new_user_session_path, :alert => "You must first log in to access this page"
  end
end
