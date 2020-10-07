class UsersController < ApplicationController #Note that controllers are always plural
    def index
        render plain: "I'm in the index action!"
    end

    def create
        render json: params
    end

    def show
        render json: params
    end 
end