class WishesController < ApplicationController

    # display form for creating new wish, set animal for collection
    # route needs to be nested within animals resource
    before_action :authenticate_user!, except: [:index]
    load_and_authorize_resource except: [:index]

    def index
        
    end

    def new 
        # set animal 
        @animal = Animal.find_by(id: params[:animal_id])
    end

    def edit

    end

    def show
        @wish = Wish.find_by(id: params[:id])
    end

    def index
        
    end

    private

    def wish_params
        params.require(:wish).permit.(:image_urls) # actual attribute will be different once image uploading functionality is built
    end

end
