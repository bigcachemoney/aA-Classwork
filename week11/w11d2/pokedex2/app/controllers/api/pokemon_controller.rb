class Api::PokemonController < ApplicationController
    def index
      @pokemon = Pokemon.all
      render :index
    end

    def show
        @pokemon = Pokemon.find(params[:id])
        render :show
    end

    private
    def poke_params
        params.require(:pokemon).permit(:attack, :defense, :image_url, :name, :poke_type)
    end

end
