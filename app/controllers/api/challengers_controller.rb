class Api::ChallengersController < ApplicationController
    def index
        @challengers = Challenger.all
        render :index
    end
    
    # (will likely just put challengers in the DB directly instead of 
    #  creating functionality to create them)
    # def new
    #     @challenger = Challenger.new
    #     render :new
    # end

    # def create
    #     @challenger = Challenger.new(challenger_params)

    #     if @challenger.save
    #         # logic here
    #         render 'api/challengers/show.json.jbuilder'
    #     else
    #         render json: @challenger.errors.messages, status: 422
    #     end
    # end

    def show
        @challenger = Challenger.find(params[:id])
        render :show
    end

    def team_challengers
        @challengers = current_user.team_challengers
        render :team
    end
end